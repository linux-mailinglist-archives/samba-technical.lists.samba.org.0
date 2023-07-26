Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A034D762838
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jul 2023 03:39:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gqPI6kZcgAcHv8iVlrc833Cr7JKN9zZqYuMRXEhUY7w=; b=a6/QwZI6lq7Rel43kWQKMCwNpU
	Yos3Hf9Qf0X3KB1WV3j+W8TU9AYIEoZ5+wgN7hjk0eWnn4R3fP0+INlQEzQRTdkeH/SQoZsJrsDxv
	AdDqHceVranuIQkMkk0nFQp8YuPF2bn8hDxVqb5225OlByMptw23ebghbHFacmhlO9vLpSY2VD0kz
	m/HzM3kk5J3JprhE4Soe66bgEutwUeq7Q1srMyYrc35MDfehd7asWXkQcW1X6N36ETxojO2VYxT4R
	aMzpBrdnswRh9alu3EGMPwBNmXA/v4lgL01+kq5bzjn//r5a7Q0rrfuffmTVzXA3C6ByuD5FbobpX
	EnX+P6Ig==;
Received: from ip6-localhost ([::1]:45186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qOTU2-005MV5-J4; Wed, 26 Jul 2023 01:38:34 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:50353
 helo=gandalf.ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qOTTw-005MUv-AY
 for samba-technical@lists.samba.org; Wed, 26 Jul 2023 01:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1690334461;
 bh=gqPI6kZcgAcHv8iVlrc833Cr7JKN9zZqYuMRXEhUY7w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=haQfaemsNUNjpX/GYxFu+BhKSqcKUdx55iHKjTDaZnhXcTUJhPKLBBD0ST5yn5h+s
 S3WaKYmUZg5MtoJPtQwXJrxhltSWYiyCqWqieN1x6XINjyJSOHx876jtbSoCIOR2hN
 UjtLipNV4vdhODry1tmxfdBhb2WHCQWvQDVgvUp2fVJ3R41bakzXBbEshIm1axFSFh
 GtdrCfAq31xgme018UE+sux6egS7OzEeGIOHZTEmgMvSR+NHy1mV+jQOyVYpRLSal3
 aHdcwoEXjMqwq+HDaNmW58WMLhY/lGP3DLj5HsfHf8Lf4CvIkXDb/UXoKkkARcohM+
 VhK3t/zqaReug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4R9bgx14vxz4wxx;
 Wed, 26 Jul 2023 11:21:01 +1000 (AEST)
Date: Wed, 26 Jul 2023 11:21:00 +1000
To: samba-technical@lists.samba.org
Subject: Re: increased `make test` logging in syslog with "debug syslog
 format = always"
Message-ID: <20230726112100.0a247d68@martins.ozlabs.org>
In-Reply-To: <a5bbc383-c781-3f94-65c1-8fc4b325e8ab@catalyst.net.nz>
References: <6a0d3223-321a-624d-111e-1c1a67ef4396@catalyst.net.nz>
 <d37fb34bffdc0ef6f3bae57eef17a399f46d37f6.camel@samba.org>
 <a5bbc383-c781-3f94-65c1-8fc4b325e8ab@catalyst.net.nz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 2404:9400:2221:ea00::3
 (mail.ozlabs.org) incorrectly presented itself as gandalf.ozlabs.org
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 26 Jul 2023 11:13:01 +1200, Douglas Bagnall via samba-technical
<samba-technical@lists.samba.org> wrote:

> On 25/07/23 17:42, Andrew Bartlett wrote:
> 
> > My intention was only to change the output format, not the destination,
> > so as to get more information (time and host etc) in the logs as the
> > previous logging to 'stdout' lost a lot of information.  
> 
> Yeah.
> 
> I can get complete `make test` syslog silence with the following patch, but I 
> don't know yet if it ruins some clever test of our logging itself.
> 
> cheers,
> Douglas
> 
> 
> 
> commit 51e857217846e9555affb94b7b588d363e126128 (HEAD -> 
> conditional-aces-the-true-story)
> Author: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
> Date:   Wed Jul 26 11:04:53 2023 +1200
> 
>      selftest: avoid logging to syslog in `make test`
> 
>      Signed-off-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
> 
> diff --git a/selftest/target/Samba4.pm b/selftest/target/Samba4.pm
> index 0bd77e906d5..3eb2388e298 100755
> --- a/selftest/target/Samba4.pm
> +++ b/selftest/target/Samba4.pm
> @@ -1220,6 +1220,7 @@ sub provision($$$$$$$$$$$)
>          # fruit:copyfile is a global option
>          fruit:copyfile = yes
> 
> +       logging = file
>          $extra_smbconf_options
> 
>   [tmp]
> 
> 

Yes, that is in Samba3.pm, so will work around the problem.

The confusing thing is that MR 3034, as per Andrew's intention, should
only change the logging format and not the logging destination.  If it
does change the destination then that's a regression, so we should hunt
it down and fix it.

Are you able to post examples of lines that end up in syslog?

Thanks...

peace & happiness,
martin

