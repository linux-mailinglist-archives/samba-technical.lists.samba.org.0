Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 481C21CB92C
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 22:47:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=3jWRZHep7cd+DGW2GjVJIPhBa8qVBIp41WUDs7y0rVI=; b=JY/H8bjWRFimK2GedhN3vfxXiQ
	Y14XwvpPRcKD+jnniq39oV26lwkwcZ2kLAHUu53Q72gt8pyNwlkzNVxWHP8bnyTT321TQIqp7S8+4
	MQaDecndpvALAoJcH5NdR3QQlwGnaJke9lAla/XFLelqRElev+Sdz0ZEFfE/uNfHVsBck5itlUlFj
	+dSNcTtcjxb718kURhOW/UIr0xJppysZlGCvXgkz6KBPIMB5CUzEddjr7KlOg08HGYq+TJrbCrYJ/
	1vkuwhLGmGrCu/wFKuqOW8j+Hayrh562DFYpP12z8cLSWu51wlW6Av7TVCt/qob0DE3LpSn+oML3e
	BhWv5ujg==;
Received: from localhost ([::1]:27986 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jX9ty-003HWw-0S; Fri, 08 May 2020 20:47:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18230) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX9ts-003HWp-Dr
 for samba-technical@lists.samba.org; Fri, 08 May 2020 20:47:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=3jWRZHep7cd+DGW2GjVJIPhBa8qVBIp41WUDs7y0rVI=; b=lpPMorWujndHsK9gKBVbHZGEIH
 nGsA3jc51aiInpzdV3mVZvIbsmOqORP/WV4ohmmnVvCs4frAcdtUMXUr4SOQSHT7FAcgzc2TdoCSA
 EJp3BdB4bKTNYo1eej25o8gp9i3bpwr8Q2gTX0cyMwAayvWW2XiIH02/TrFcLkXZQtNyeVZd/FZFz
 HqlZemEOauCO+Nc0DSt9r2WMAe11/HxFwRoeNqSPX70w1cq4rkWN+vPdcFjPrPOX7B746fcx0Db6L
 2tPDUvWads/fb9CXl2/ppJD+45OSbkxQ5N0EfdchK2NtZEXnWJm1Ab/s7KtPZ90e8fnICpo4RDWF0
 7e16TaWT61EvrMVCs/pB6HMssZMltATn+EO5Ez9/8+cnHFZbfqvhqpva3yfDvo38WCt1k240DwdFl
 U2Tkt6pWg5+ZF4kkpdjkEZLVeoT5GOQ2i2bYWutCsEers5yJNzwf6dBciBxLHXFvcxYt4zLILix+4
 F1B/UeDpPH+BpoWkeQiPXjN5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jX9tr-0000ag-DU; Fri, 08 May 2020 20:47:15 +0000
Date: Fri, 8 May 2020 13:47:09 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200508204709.GG26399@jeremy-acer>
References: <3a3e311c7a4bc4d4df371b95ca0c66a792fab986.camel@cryptolab.net>
 <20200507213002.GG14929@jeremy-acer>
 <20200508040711.GC3369@jeremy-acer>
 <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
 <20200508062725.GB28687@jeremy-acer>
 <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
 <8e7d4319-a919-a364-8337-29308926f509@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e7d4319-a919-a364-8337-29308926f509@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Anoop C S <anoopcs@cryptolab.net>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 08, 2020 at 09:35:31PM +0200, Stefan Metzmacher via samba-technical wrote:
> 
> Thanks very much Jeremy! I didn't noticed that.
> 
> I guess the attached patch should be able to fix the recursion.

Oh Metze that's *really* ugly :-). I thought about
doing that in my code and decided it was in too bad
taste to live :-).

Is there a cleaner way than putting "busy" and "retry"
variables in the config struct ?


> From a1819f8b03ca43c860bdff7b2bdde79674fe7cc4 Mon Sep 17 00:00:00 2001
> From: Stefan Metzmacher <metze@samba.org>
> Date: Fri, 8 May 2020 21:29:53 +0200
> Subject: [PATCH] vfs_io_uring: avoid stack recursion of
>  vfs_io_uring_queue_run()
> 
> Instead we remember if recursion was triggered and jump to
> the start of the function again from the end.
> 
> BUG: https://bugzilla.samba.org/show_bug.cgi?id=14361
> 
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>  source3/modules/vfs_io_uring.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
> index a7308ff9edd3..1340d3a5ca9e 100644
> --- a/source3/modules/vfs_io_uring.c
> +++ b/source3/modules/vfs_io_uring.c
> @@ -35,6 +35,8 @@ struct vfs_io_uring_request;
>  struct vfs_io_uring_config {
>  	struct io_uring uring;
>  	struct tevent_fd *fde;
> +	bool busy;
> +	bool need_retry;
>  	struct vfs_io_uring_request *queue;
>  	struct vfs_io_uring_request *pending;
>  	bool nowait_pread;
> @@ -253,13 +255,22 @@ static void vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
>  	struct timespec end_time;
>  	int ret;
>  
> -	PROFILE_TIMESTAMP(&start_time);
> -
>  	if (config->uring.ring_fd == -1) {
>  		vfs_io_uring_config_destroy(config, -ESTALE, __location__);
>  		return;
>  	}
>  
> +	if (config->busy) {
> +		config->need_retry = true;
> +		return;
> +	}
> +	config->busy = true;
> +
> +start_again:
> +	config->need_retry = false;
> +
> +	PROFILE_TIMESTAMP(&start_time);
> +
>  	for (cur = config->queue; cur != NULL; cur = next) {
>  		struct io_uring_sqe *sqe = NULL;
>  		void *state = _tevent_req_data(cur->req);
> @@ -299,6 +310,12 @@ static void vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
>  	}
>  
>  	io_uring_cq_advance(&config->uring, nr);
> +
> +	if (config->need_retry) {
> +		goto start_again;
> +	}
> +
> +	config->busy = false;
>  }
>  
>  static void vfs_io_uring_request_submit(struct vfs_io_uring_request *cur)
> -- 
> 2.17.1
> 





