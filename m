Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BB22337DA
	for <lists+samba-technical@lfdr.de>; Thu, 30 Jul 2020 19:45:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=I+9iN1YHnkQ99zJpRts9qXlTRpTuEppfgk/IxSwpZI0=; b=P3szMArA5zfR3lpS/3zqMzpvFp
	mAGf8HWC5moP59SwND10vMyQo6qT0B0J+zqpmsSW9RTujs+Y+Y11FA+sjd/yeZ/OoFBGE45zi3laZ
	UiRFSFZ4IxNAjB1GNRPidplEgxIf4PF5gEq4zd94YZElV7p0X5NV53vYnyDMdbUHsbDSBS8y/SUrp
	0JxL1Gntx7HPSI2w22ysIASLQzf30PjOC8bnfOLlFaULdTRotH0ga82IeXIlD9emfW/CekDx0oMov
	SpBYtEE1TXkOB7+eTbj6Z1qk3c5YmCWG3hPCXoLKdf60WovufyHNtYxFGpVEFKyalMduYPklucA8T
	QfMIgl1w==;
Received: from localhost ([::1]:51622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k1CbJ-00AKHm-Bq; Thu, 30 Jul 2020 17:44:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34960) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k1CbC-00AKHf-Jw
 for samba-technical@lists.samba.org; Thu, 30 Jul 2020 17:44:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=I+9iN1YHnkQ99zJpRts9qXlTRpTuEppfgk/IxSwpZI0=; b=Cdh//x9PIT4/futWbPuexDF8Sp
 voyAnUxjDDY5xexTAv0/Ii4hF68ujHTOgrMPPrzh7AMeevgr4kJxuEONWWD5S4tOPlAeWzE9s/RiJ
 aOMkek4erBkISud92w6yv9hUvF/aXlZt3tlc7Ms2nM/RtXsCYf4bKWTbCUHv33dY2jc7LPCGzDf+9
 bgPex9WZwkuPTSeshfdV2BNCCVPEfugjzUvTpSVnZ0uuc1ySC9XLTNTAeXFUyzzBQNcMetKjn4hGY
 sSyVPTV4BW9QILugAWVNNb5oCdpZmP55PKMF0Rt+i4WhAe6XLQu7T4WP4aW+busm+k7+0K5JjqDvf
 6voHGsDbPYWszoolXFjc5ZKJ/q2jrCifBjQk7JcLc3xXwVOqRaqhQdwXL7fjnyxdTEBrYt2688YMX
 /faN1+68Iaz93/Voj/crkNNAPKL23++ErvmD5Am28XcnhID0WSonaYEb3ueof28LE0q6W3wsa+9fl
 7gZ95C5pz15ZowX9je2raMB5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k1CbB-0005YQ-QB
 for samba-technical@lists.samba.org; Thu, 30 Jul 2020 17:44:10 +0000
Date: Thu, 30 Jul 2020 10:44:04 -0700
To: samba-technical@lists.samba.org
Subject: Re: PATCH: fix compile error with xlc on AIX
Message-ID: <20200730174404.GB3868@jeremy-acer>
References: <20200710115838.GA1587460@sernet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200710115838.GA1587460@sernet.de>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jul 10, 2020 at 01:58:38PM +0200, Björn JACKE via samba-technical wrote:
> Hi,
> 
> please review and push eventually...
> 
> Thanks
> Björn

Hi Björn,

Where are we with this ? Did it get merged or submitted as
a gitlab MR ?

I can't find it...

Jeremy.

> From cf0994c69bc89cc73009541bf087d264478501f4 Mon Sep 17 00:00:00 2001
> From: Bjoern Jacke <bj@sernet.de>
> Date: Fri, 10 Jul 2020 11:48:51 +0000
> Subject: [PATCH] libsmb: fix build with xlc on AIX
> 
> xlc complains:
> 
> 1506-067 (S) A struct or union can only be assigned to a compatible type.
> 
> BUG: https://bugzilla.samba.org/show_bug.cgi?id=14438
> 
> Signed-off-by: Bjoern Jacke <bjacke@samba.org>
> 
> ---
>  source3/libsmb/libsmb_stat.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/source3/libsmb/libsmb_stat.c b/source3/libsmb/libsmb_stat.c
> index 790934bd565..8abc6043030 100644
> --- a/source3/libsmb/libsmb_stat.c
> +++ b/source3/libsmb/libsmb_stat.c
> @@ -102,18 +102,24 @@ void setup_stat(struct stat *st,
>  	}
>  
>  	st->st_dev = dev;
> -	st->st_atim = access_time_ts;
> -	st->st_ctim = change_time_ts;
> -	st->st_mtim = write_time_ts;
> +	st->st_atim.tv_sec = access_time_ts.tv_sec;
> +	st->st_atim.tv_nsec = access_time_ts.tv_nsec;
> +	st->st_ctim.tv_sec = change_time_ts.tv_sec;
> +	st->st_ctim.tv_nsec = change_time_ts.tv_nsec;
> +	st->st_mtim.tv_sec = write_time_ts.tv_sec;
> +	st->st_mtim.tv_nsec = write_time_ts.tv_nsec;
>  }
>  
>  void setup_stat_from_stat_ex(const struct stat_ex *stex,
>  			     const char *fname,
>  			     struct stat *st)
>  {
> -	st->st_atim = stex->st_ex_atime;
> -	st->st_ctim = stex->st_ex_ctime;
> -	st->st_mtim = stex->st_ex_mtime;
> +	st->st_atim.tv_sec = stex->st_ex_atime.tv_sec;
> +	st->st_atim.tv_nsec = stex->st_ex_atime.tv_nsec;
> +	st->st_ctim.tv_sec = stex->st_ex_ctime.tv_sec;
> +	st->st_ctim.tv_nsec = stex->st_ex_ctime.tv_nsec;
> +	st->st_mtim.tv_sec = stex->st_ex_mtime.tv_sec;
> +	st->st_mtim.tv_nsec = stex->st_ex_mtime.tv_nsec;
>  
>  	st->st_mode = stex->st_ex_mode;
>  	st->st_size = stex->st_ex_size;
> -- 
> 2.20.2
> 


