using UnityEngine;

public class PlayerScene : MonoBehaviour
{
    private Animator animator;
    private Rigidbody2D rb;

    // Movement variables
    public float moveSpeed = 5f;

    private enum PlayerState { Idle, Running, Jumping }
    private PlayerState currentState;

    void Start()
    {
        animator = GetComponent<Animator>();
        rb = GetComponent<Rigidbody2D>();
        currentState = PlayerState.Idle;
    }

    void Update()
    {
        HandleMovement();
        UpdateAnimationState();
    }

    private void HandleMovement()
    {
        float move = Input.GetAxis("Horizontal");
        rb.velocity = new Vector2(move * moveSpeed, rb.velocity.y);

        if (move != 0)
        {
            currentState = PlayerState.Running;
        }
        else
        {
            currentState = PlayerState.Idle;
        }
    }

    private void UpdateAnimationState()
    {
        animator.SetBool("isRunning", currentState == PlayerState.Running);
        animator.SetBool("isIdle", currentState == PlayerState.Idle);
        // Add additional state conditions as needed
    }
}