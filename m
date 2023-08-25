Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 09094787E6A
	for <lists+samba-technical@lfdr.de>; Fri, 25 Aug 2023 05:17:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=LAkKu6FL3psYPwTJKqTe5hcoLbeU4e6jo6wy2FgdVVQ=; b=0qI1S1GMDhH9teqyKOeJmaey+b
	LUfqJq7aQw69YJjTjCKfCvgP/yhiyBgmKGhnTK9io7Jn9+HIdNMlTK6qbx6d3xSOBha4JFURH520n
	rKgBIYgtrEOSf5hHkomAJu6IQCFgCXRvk+LoTr+TVH2FhyqtYr3+yVZbEkyonayn/TxT6voTQycbA
	OaBDp7Ed5PvavQi2pAo5OLmpwMd16EDi5CISg733CWJWg1kJNqZnJNdqD20mTAwiT262PQuBcleHv
	S88dOwIg95SBX4LvjBfYRBwoOj4bHeWQBiJqVTAO5QnTmqu2yLAJY5YQhxyUfLZckYyL6KI7zgm2G
	vYiXuknQ==;
Received: from ip6-localhost ([::1]:43258 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qZNJ6-00EOo6-SJ; Fri, 25 Aug 2023 03:16:20 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:37004) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qZNIx-00EOnw-Az
 for samba-technical@lists.samba.org; Fri, 25 Aug 2023 03:16:17 +0000
Received: from [IPV6:2404:130:0:1000:2225:64ff:fe75:8a7f] (unknown
 [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id E949181A9B; 
 Fri, 25 Aug 2023 15:16:00 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1692933361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LAkKu6FL3psYPwTJKqTe5hcoLbeU4e6jo6wy2FgdVVQ=;
 b=Jq9GvrEN0vWbSQDGDs48qQvlLjlemgtouqt32sr7uSYYuXnZ/mqbEBJBG6UysA20+X6FjF
 TIO4LwL3UtyLWMk1913AuVgbiPM/vwa5VCDXx02CXCfTo69x8Z+3URKhy+GedurzWZDobv
 72hbsLI5kTwro02+KK9RE1hpZziGePfx+1p4ifhjz0iFgtEXe7b4qlAEHQSE0gkysFjyKP
 LEoR1HloDUpH+uZ+S8gI3wntKapqZuYg3QUDo2b8mxVEr66BtukoQKMKoIwylcH1uaVLPG
 QPpM/DojsvSioHhrkHvPOOq7ODbgSeLc/t7xRdegWuvi1Xs3jZZhFeDPo6BoMw==
Message-ID: <0b6e0b93-ac34-da36-287d-7581a177ba54@catalyst.net.nz>
Date: Fri, 25 Aug 2023 15:15:59 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: increased `make test` logging in syslog with "debug syslog format
 = always"
To: Martin Schwenke <martin@meltin.net>
References: <6a0d3223-321a-624d-111e-1c1a67ef4396@catalyst.net.nz>
 <d37fb34bffdc0ef6f3bae57eef17a399f46d37f6.camel@samba.org>
 <bb9223b0-ec58-83ff-bad8-a241fa003ec6@catalyst.net.nz>
 <20230726203352.6c6cfa15@martins.ozlabs.org>
Content-Language: en-US
In-Reply-To: <20230726203352.6c6cfa15@martins.ozlabs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 26/07/23 22:33, Martin Schwenke wrote:
> 
> Can we just call debug_file_log() directly when necessary, like this?
>

The answer is yes.

> diff --git a/lib/util/debug.c b/lib/util/debug.c
> index b83075cb239..0e13fa564e3 100644
> --- a/lib/util/debug.c
> +++ b/lib/util/debug.c
> @@ -1559,25 +1559,10 @@ void check_log_size( void )
>   static void Debug1(const char *msg, size_t msg_len)
>   {
>   	int old_errno = errno;
> -	enum debug_logtype logtype = state.logtype;
>   
>   	debug_count++;
>   
> -	if (state.settings.debug_syslog_format == DEBUG_SYSLOG_FORMAT_ALWAYS) {
> -		switch(state.logtype) {
> -		case DEBUG_STDOUT:
> -		case DEBUG_STDERR:
> -		case DEBUG_DEFAULT_STDOUT:
> -		case DEBUG_DEFAULT_STDERR:
> -			/* Behave the same as logging to a file */
> -			logtype = DEBUG_FILE;
> -			break;
> -		default:
> -			break;
> -		}
> -	}
> -
> -	switch(logtype) {
> +	switch(state.logtype) {
>   	case DEBUG_CALLBACK:
>   		debug_callback_log(msg, msg_len, current_msg_level);
>   		break;
> @@ -1585,13 +1570,18 @@ static void Debug1(const char *msg, size_t msg_len)
>   	case DEBUG_STDERR:
>   	case DEBUG_DEFAULT_STDOUT:
>   	case DEBUG_DEFAULT_STDERR:
> -		if (dbgc_config[DBGC_ALL].fd > 0) {
> -			ssize_t ret;
> -			do {
> -				ret = write(dbgc_config[DBGC_ALL].fd,
> -					    msg,
> -					    msg_len);
> -			} while (ret == -1 && errno == EINTR);
> +		if (state.settings.debug_syslog_format ==
> +		    DEBUG_SYSLOG_FORMAT_ALWAYS) {
> +			debug_file_log(current_msg_level, msg, msg_len);
> +		} else {
> +			if (dbgc_config[DBGC_ALL].fd > 0) {
> +				ssize_t ret;
> +				do {
> +					ret = write(dbgc_config[DBGC_ALL].fd,
> +						    msg,
> +						    msg_len);
> +				} while (ret == -1 && errno == EINTR);
> +			}
>   		}
>   		break;
>   	case DEBUG_FILE:
> 
> I haven't tested this.

I did. It worked -- or at least it returned things to where they were at 
some point in the past when syslog would get just the copyright lines 
from every make test.

I forgot about this all because I had `logging = file` in my working 
tree's selftest/target/Samba4.pm, which made even the copyrights shut up.

> If it is OK, I think we could also revert the changes to
> dbghdrclass(), though we would be generating a header for no
> reason... but I think we did that before.

Yeah. I will make an MR in a few days unless you do first.


Douglas

