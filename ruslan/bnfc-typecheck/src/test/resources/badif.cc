    // file badif.cc

    int factr (int n)
    {
      if (true && false)
        return 1 ;
      else
        return (n * factr(n-1)) ;
    }