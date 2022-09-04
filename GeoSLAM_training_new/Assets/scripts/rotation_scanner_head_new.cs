using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class rotation_scanner_head_new : MonoBehaviour   
{
    public float speed = 60;

    // Update is called once per frame
    void FixedUpdate()
    {
        // Scanner head rotation;
        transform.Rotate(Vector3.down * speed * Time.deltaTime);
    }
}
