Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DD533788D42
	for <lists+samba-technical@lfdr.de>; Fri, 25 Aug 2023 18:41:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=zwWtD5MjjgkmuPzLyKsqBqZopIG5e1S9ZnP+N58ATV0=; b=XDQR2PH0NKtRUni6UUIWqDXop7
	vN5vpb8B1dHT5A85f/aQngOYyxXc4n4Dy2W0JsU5qCriUCiNkdgi7Z4KwTnFs2xKeUJy/EO+hZkbY
	vfv35y5K9CQGcnc6ClQ9dc/KX4RBbxLCAy8Fkr1iU2caSxXoALPVTqPpe6i+hvVwktxmpnESSgZxN
	1vwY1MrAcFav8hSa9p4mClkoYtYyaZ4i500YdwiLaf8wI1K/1v5Qo07FNnRMuNwfJXAzfa+v++cXz
	pDVd1K1z+rnxIY/qr6lK3HhSsHCFZ8+FXkCbbTZrnPMRklAIIfmzrIJEjofgaaVA9nBbEY41Y/OXf
	9dzB3iGw==;
Received: from ip6-localhost ([::1]:41936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qZZrw-00ETf9-TI; Fri, 25 Aug 2023 16:41:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30120) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qZZro-00ETez-5g
 for samba-technical@lists.samba.org; Fri, 25 Aug 2023 16:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=zwWtD5MjjgkmuPzLyKsqBqZopIG5e1S9ZnP+N58ATV0=; b=abbzuOBjt+I9hhuLqrEimyLIdb
 YnIPwE6e0GgpT0ZpD/ZEAk8BStkm7hsfllqWpQ9KCkcHaPUSVxtmn59+T1GOdRq854zCsrLJtH5xj
 NrUM3N960gSlvSyJW8CjYXVYG7vvpq1N7AhU/LJaiHIqBB3imd8xdWh1/nt+g+wIIJe9lX1RH4Qd1
 hvc8bjI1WNUS0lIz1NTgIvkHeYA9a08grbEOZh7nfP15EW0f60kBBioETn+Eo5eQze0XTZl5HDNka
 2xR9/1KRqc7xztUbjL180ni7MeLO1tO7k6f394UdfJdLMB4hRyhsMgoznqtO6nyVnO17cGGzEKXSY
 zdBX5xWCmlzur9YT6A9GUyUMVZiw4IjVIpANzLpzz4I3uyJP/N0VW6NSyg4M8XtNiFLNvsoHXlPHV
 vXp8H9mBPU91RgUkWEE/LALUfl2MfMj/P0K1pop1LCV3c5KB77AxDxYQYtHW1AkjGn0oDvINzwOqO
 jp8lE+DmnY+iU5TzSeLY4Dw2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qZZrm-009y8f-2S; Fri, 25 Aug 2023 16:40:59 +0000
Date: Fri, 25 Aug 2023 09:40:55 -0700
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: Error injection in the MSRPC code in Samba as an AD
Message-ID: <ZOjZlw8AUWPCTgvu@jeremy-acer>
References: <CACyXjPw-ew8=qG_oAv7AY9nyMTM2On3acLdzAuh9XcFMUYVpQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACyXjPw-ew8=qG_oAv7AY9nyMTM2On3acLdzAuh9XcFMUYVpQA@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Aug 25, 2023 at 09:02:43AM -0700, Richard Sharpe via samba-technical wrote:
>Hi folks (and Jeremy :-),
>
>We have seen a bunch of issues around winbindd and issues caused by
>errors from Windows domain controllers or delays because the DCs are
>far away or slow.
>
>To try to create more robust code I have embarked on a project to
>allow the injection of errors into the Samba AD code when handling
>MSRPC requests.
>
>We tried other approaches, like using the Linux networking code to
>randomly drop packets or inject delays, but this was not very useful.
>We also tried adding error injection into the winbind code when
>handling responses, but that creates issues around packaging. So, it
>seemed like it would be easier to add it to the AD code and then
>provision test systems with the correct setups.
>
>The changes occur in a couple of areas:
>
>1. In PIDL I have modified the generated code to parse an smb.conf
>parameter to do error injection during the RPC library setup and then
>to handle the specific requests when functions are called (see below
>for more details of the smb.conf params.)
>
>2. In librpc/rpc/dcesrv_core.c et al, allow delays to be inserted into
>RPC responses by using some tevent magic.
>
>The sort of smb.conf parameters I am thinking of are:
>
>lsarpc error inject = lsa_LookupSids error NT_STATUS_RPC_CALL_FAILED 10
>
>which says to inject the specified error into lsa_LookupSids every
>tenth call, or
>
>lsarpc error inject = lsa_LookupSids delay 30000 10
>
>inject a delay of 30,000 milliseconds into every tenth call.
>
>Having said all that, there seems to be willingness among my managers
>to try to upstream this code.
>
>So, is this of interest to anyone?
>
>Should I post examples of the changes (to 4.19.0rc1 but they seem to
>apply to master).
>
>Is anyone interested in providing feedback?

Fantastic work Richard. I've already seen a preliminary
version of this patch, sorry I haven't had time to respond
(yet:-).

My only suggestion would be to bracket the changes in a --with-ad-error-injection
at configure time. People able to use this should be able to
build a custom Samba (IMHO).

If you can see any value in having this enabled for real
customers though I'm willing to be wrong (as usual :-).

Cheers,

	Jeremy.

