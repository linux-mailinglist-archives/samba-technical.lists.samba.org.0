Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8028F1CBA21
	for <lists+samba-technical@lfdr.de>; Fri,  8 May 2020 23:51:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=6nXdgVhHRf3MIbDugL4ztXEHmBkWPAEz9GqGNahlPcs=; b=PD0iFc3abA9meAeqiR/R4Tatfi
	fSJFXMnnBvuxVaqx8BvwxjIaZbqQ/8AJrJ/ZNnbFMFADh24lSITSgjsyUcb/eV9Bdwen1XwGiI25W
	BcxUyK1ituvluVPyfZqBd9Ks6ZvCzhdKpns7m7W7+htFN8CVthvmJN1mw+D5le3V/aLYD9BrGP2fR
	71yHWkqpihNgy0lXKdZTYOcqsSyn/L/8Ol1mrWJ4pet6dUAR4xno47/vLiUkqY0HdDEotEeNmPEOG
	Y/u8wSq26AKibwhgvZL0in2Q7Ah9c/6NtbuT4hL74bu4uKMtMctTGL4OcMKuZQsBeVGLZVIjQPBls
	lsSxQuMQ==;
Received: from localhost ([::1]:32612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jXAtf-003IFO-N9; Fri, 08 May 2020 21:51:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39952) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXAta-003IFH-LA
 for samba-technical@lists.samba.org; Fri, 08 May 2020 21:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=6nXdgVhHRf3MIbDugL4ztXEHmBkWPAEz9GqGNahlPcs=; b=VjJc86v6mISpE2ym6fqkluPoJg
 ro52Vh2MeJviKO3UnF/rb5JtVKqGK0o+MxMVhmwVlfpM2GS0/SXwM1nsHgp7JroBEELjCRR3wsFkG
 Yv3B1JcXfn4nrgj8Q3+F/5OymhF982aZyPZhSS15O7vwuDHgGT9ApXgT8c7YCw9FyCrY3IAEe3ECE
 tPR/MtHJLgQ5FTMDLgxuYY8Kgom1pwds6BSC1H6zBz6Q4ZtrA2gJu7i0JuWgWsY+pSdsxryHnr7Gg
 9GlQ+Q4T72rw7uhF8pDAnlqo3Hs0qRdDJRLSzUEWr5ZaF+/KbvUbu09AiHEDL/rImvumEPKBVIrVT
 XPRuby8NSSnC7jZ+W/VgBn8EJX6XTdLLJRYY3cQp+Ri0tdeWBU2LS+965OD1UWWBl8bSYFDa91YsZ
 Oa2GY3tjSUXpaUjr4pBtEXBYH/E1TCoBhjOmJEfTn1WOWYoDpLVCrp9u01t4Mi/du4QfmoCASUj/D
 WzCTXv5eTjloLht5R1gzhguB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXAtZ-00012t-F2; Fri, 08 May 2020 21:51:01 +0000
Date: Fri, 8 May 2020 14:50:55 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
Message-ID: <20200508215055.GA2912@jeremy-acer>
References: <e8f863ca6f5a983bc2a83eeefdd0ded99b0f7e2c.camel@cryptolab.net>
 <20200508062725.GB28687@jeremy-acer>
 <3c150c7ef40086ccb392e2911e954386f8c2bd0a.camel@cryptolab.net>
 <6e4d9002-6887-5c01-e992-1d893b3e6d63@samba.org>
 <ebdfdcd6d3ceab5f43172b3323589a5bcfcd957f.camel@cryptolab.net>
 <20200508185339.GD26399@jeremy-acer>
 <8e7d4319-a919-a364-8337-29308926f509@samba.org>
 <20200508204709.GG26399@jeremy-acer>
 <20200508205140.GH26399@jeremy-acer>
 <4e66af50-d900-3ed1-7d27-8b399cf63143@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e66af50-d900-3ed1-7d27-8b399cf63143@samba.org>
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
 Samba Technical <samba-technical@lists.samba.org>, jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 08, 2020 at 11:40:30PM +0200, Stefan Metzmacher wrote:
> Am 08.05.20 um 22:51 schrieb Jeremy Allison:
> > On Fri, May 08, 2020 at 01:47:09PM -0700, Jeremy Allison via samba-technical wrote:
> >> On Fri, May 08, 2020 at 09:35:31PM +0200, Stefan Metzmacher via samba-technical wrote:
> >>>
> >>> Thanks very much Jeremy! I didn't noticed that.
> >>>
> >>> I guess the attached patch should be able to fix the recursion.
> >>
> >> Oh Metze that's *really* ugly :-). I thought about
> >> doing that in my code and decided it was in too bad
> >> taste to live :-).
> >>
> >> Is there a cleaner way than putting "busy" and "retry"
> >> variables in the config struct ?
> > 
> > And a "Goto again" as well :-(. Bleegh.
> 
> This version would actually work and looks a bit similar to
> your version.
> 
> Can you life with that version?

Yes I can live with that :-). It at least moves the horror
to the wrapper function where you can at least concentrate
all your attention as to why it's doing what it's doing :-).

RB+ from me if you add a comment header above the function
as well as in the commit so it explains what it's doing.

Feel free to crib my ascii art to explain in the header
comment too :-).

Thanks for the cleanup !

Jeremy.

> From ce467400f4098d0edbee9534a5667c0b92422e8f Mon Sep 17 00:00:00 2001
> From: Stefan Metzmacher <metze@samba.org>
> Date: Fri, 8 May 2020 21:29:53 +0200
> Subject: [PATCH] vfs_io_uring: avoid stack recursion of
>  vfs_io_uring_queue_run()
> 
> Instead we remember if recursion was triggered and jump to
> the start of the function again from the end.
> 
> This should make it safe to be called from the completion_fn().
> 
> BUG: https://bugzilla.samba.org/show_bug.cgi?id=14361
> 
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>  source3/modules/vfs_io_uring.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/source3/modules/vfs_io_uring.c b/source3/modules/vfs_io_uring.c
> index ee23449c63c6..df41c74a7953 100644
> --- a/source3/modules/vfs_io_uring.c
> +++ b/source3/modules/vfs_io_uring.c
> @@ -34,6 +34,8 @@ struct vfs_io_uring_request;
>  struct vfs_io_uring_config {
>  	struct io_uring uring;
>  	struct tevent_fd *fde;
> +	bool busy;
> +	bool need_retry;
>  	struct vfs_io_uring_request *queue;
>  	struct vfs_io_uring_request *pending;
>  };
> @@ -222,7 +224,7 @@ static int vfs_io_uring_connect(vfs_handle_struct *handle, const char *service,
>  	return 0;
>  }
>  
> -static void vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
> +static void _vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
>  {
>  	struct vfs_io_uring_request *cur = NULL, *next = NULL;
>  	struct io_uring_cqe *cqe = NULL;
> @@ -280,6 +282,22 @@ static void vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
>  	io_uring_cq_advance(&config->uring, nr);
>  }
>  
> +static void vfs_io_uring_queue_run(struct vfs_io_uring_config *config)
> +{
> +	if (config->busy) {
> +		config->need_retry = true;
> +		return;
> +	}
> +	config->busy = true;
> +
> +	do {
> +		config->need_retry = false;
> +		_vfs_io_uring_queue_run(config);
> +	} while (config->need_retry);
> +
> +	config->busy = false;
> +}
> +
>  static void vfs_io_uring_fd_handler(struct tevent_context *ev,
>  				    struct tevent_fd *fde,
>  				    uint16_t flags,
> -- 
> 2.17.1
> 





