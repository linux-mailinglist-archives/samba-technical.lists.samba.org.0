Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BC72D7B1
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2019 10:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Xb75Re2IzHOQWmgIytjwA72tpHvzdiseM33GtItb0JM=; b=YXmd7usSDTq545GUAaKCfhmEMP
	IOU9qCaYBq1yLDve1l3lW0sMmTHbWBNh1vJMJ/vYV52RBCfJFNlOlPVPLyz6CpND9nT1oNybCgb0I
	kWFkUQ7Qsk57aOeYvtyaMZUoGx8z19yJXdGpW/5hSOMCNN8m7iuarkRAAR4nO9/skPM6hGaVyvfpO
	fx4InNkPxCWeSTn3rBY3zJZ9KpSbrsLDC2AhMSgcpmxlD9LHqsi32vF7U4MSl+MixYgVrVa38mffl
	WTxpfXbWlhzZv41ZmkH1mhF9nvD4tK3KlSr+oYxfTH0OB4icIuriVv5CAXYvWdmV0pmft/vdfpIzb
	XDMqzj4A==;
Received: from localhost ([::1]:22406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVtsQ-002Sef-Of; Wed, 29 May 2019 08:24:02 +0000
Received: from [2a01:4f8:192:486::147:1] (port=54058 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVtsN-002SeX-E4
 for samba-technical@lists.samba.org; Wed, 29 May 2019 08:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=Xb75Re2IzHOQWmgIytjwA72tpHvzdiseM33GtItb0JM=; b=gNcwVD1cMtePhTYH6IQZ89MOSn
 zL05D3k/aXS6s8vcfbWJ5i3NfsbEaVccmDL892+JiPV+KiDp3lo+R80WUK8DDPjGV49Nb1v9QefHD
 6llYWPIt5yHhNgtk34fjA1vw/s6cwuMuwe++nnXyi6GNEWTqoMNjbWBv10OO3u0eSb0M=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVtsH-0008Gs-93; Wed, 29 May 2019 08:23:53 +0000
Date: Wed, 29 May 2019 11:23:51 +0300
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: [PATCH] Fix compile error with --enable-selftest
Message-ID: <20190529082351.GC4871@onega.vda.li>
References: <42f879d1e0abfd4dd2e6c299b9184a7dfc5afacd.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42f879d1e0abfd4dd2e6c299b9184a7dfc5afacd.camel@cryptolab.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 29 touko 2019, Anoop C S via samba-technical wrote:
> Hi,
> 
> Please find the attached patch which fixes the following error while
> compiling with --enable-selftest configure option:
> 
> ../../source3/utils/smbcontrol.c: In function ‘do_sleep’:
> ../../source3/utils/smbcontrol.c:435:2: error: ‘input’ undeclared
> (first use in this function)
>   435 |  input = atol(argv[1]);
>       |  ^~~~~
> ../../source3/utils/smbcontrol.c:435:2: note: each undeclared
> identifier is reported only once for each function it appears in
> ../../source3/utils/smbcontrol.c:436:27: error: ‘MAX_SLEEP’ undeclared
> (first use in this function)
>   436 |  if (input < 1 || input > MAX_SLEEP) {
>       |                           ^~~~~~~~~
> ../../source3/utils/smbcontrol.c:444:2: error: ‘seconds’ undeclared
> (first use in this function); did you mean ‘send’?
>   444 |  seconds = input;
>       |  ^~~~~~~
>       |  send
> 
> CI run: https://gitlab.com/samba-team/devel/samba/pipelines/63654943
> 
> Reviews are appreciated.
> 
> Anoop C S.

> From 15084117d6dcebbcd8112661ab1a7f0ee8efce1b Mon Sep 17 00:00:00 2001
> From: Anoop C S <anoopcs@redhat.com>
> Date: Wed, 29 May 2019 11:40:55 +0530
> Subject: [PATCH] s3-smbcontrol: Replace && with || to declare variables in
>  do_sleep()
> 
> --enable-developer internally use --enable-selftest alongside. But when
> configured only with --enable-selftest the following code block becomes
> invalid:
> 
>  #if defined(DEVELOPER) && defined(ENABLE_SELFTEST)
>         unsigned int seconds;
>         long input;
>         const long MAX_SLEEP = 60 * 60; /* One hour maximum sleep */
>  #endif
> 
> making those variables undecalred for further use. Therefore replace &&
> with || to have those variables declared with --enable-selftest
> configure option.
Please fix a typo in the commit message (undecalred). With that fix,
RB+.

> 
> Signed-off-by: Anoop C S <anoopcs@redhat.com>
> ---
>  source3/utils/smbcontrol.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/source3/utils/smbcontrol.c b/source3/utils/smbcontrol.c
> index 7a761a6ff59..b2aa1dfa2a6 100644
> --- a/source3/utils/smbcontrol.c
> +++ b/source3/utils/smbcontrol.c
> @@ -415,7 +415,7 @@ static bool do_sleep(struct tevent_context *ev_ctx,
>  		     const struct server_id pid,
>  		     const int argc, const char **argv)
>  {
> -#if defined(DEVELOPER) && defined(ENABLE_SELFTEST)
> +#if defined(DEVELOPER) || defined(ENABLE_SELFTEST)
>  	unsigned int seconds;
>  	long input;
>  	const long MAX_SLEEP = 60 * 60; /* One hour maximum sleep */
> -- 
> 2.21.0
> 


-- 
/ Alexander Bokovoy

