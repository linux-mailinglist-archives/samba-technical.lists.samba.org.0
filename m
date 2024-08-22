Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EB995BF5F
	for <lists+samba-technical@lfdr.de>; Thu, 22 Aug 2024 22:02:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=RJIr9PAQVdwFbdMOhFM2xkJumPryLsInKUBvirTGJww=; b=ufsW/7Xyq41RDyyCA9WfzJZBbZ
	s2vGlfPfRRxbJsvtrUeqqPOUNHvTTMSaMTzW5trrv5n0QyqssZQ48MAiMKmzE+g+Pe3/m/acpUQt3
	HYlI/tqrcIPnozm41l/4TWPhjT0cgF4WOsA5PB+19q4I9xq5VznPoOkSTb+iRugD3AoFk9GDN5eh6
	XX9qf75jvazZ5SpXUELSWHVWhgbIdMicJmW5kIDSdpC/TNr/vKdsfITwFSWXQCsLBD4ymsLE3A5EW
	B0R4YmabKbg0szaoFdNf2S/z7GgT4Nahjdkb+2YdITLu3vEaqkcVrgNiX9FAyxRird5WBsXt81aEc
	+Fhru2Mg==;
Received: from ip6-localhost ([::1]:44552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1shE0N-005Hen-E8; Thu, 22 Aug 2024 20:01:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37918) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1shE0I-005Heg-KY
 for samba-technical@lists.samba.org; Thu, 22 Aug 2024 20:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=RJIr9PAQVdwFbdMOhFM2xkJumPryLsInKUBvirTGJww=; b=mB2DEzNB5IGXwS81/fhT3CcQDg
 nhYPuvKc7eKsDDUwKUH0EtxzfUTIUS/rqKN+L3UrtVuGcTYbMXvj9Cg1RXs3r7AafEDIprRs4Ir3V
 aKOrR/W2pbJa30cru5xbPodqvCaqhFVdWv2SHG3Xs+ZZQRELE3CJxsIrPSeDeAhc3wFJF6KDLfwHb
 BKZhjURXTDKufwx8S8e12jHeVBLLHQ7Tb62QV4VeOjK+IbfZ5J6ihZtHI9T67Y/omhF80/1I/weq+
 wyVpDeu51dW2cdbyWRwhjUK/MpnmQL9yIxLtxGhW/0rbW7dqpJwUCYWyffySB84Kt/Fp6i4AoNPhA
 dkyfmS6hphE1s9JSn7bxyjMZXsmQAUVN4ViZrp4+X05xzG1uM21UMQC31eeBH4kdhzfP4MYOREe2c
 +ydZuoC5W47ca4HMfySQd5J/gR2rgzyi+XjZ0GZRQMExHDVevuDR9sfGWKw5LZHnICor14D3uy1dW
 2OZLeRE9i/OBzJW9LKMSCeIx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1shE0G-007hXI-2J; Thu, 22 Aug 2024 20:01:53 +0000
Date: Thu, 22 Aug 2024 13:01:50 -0700
To: John Hixson <jhixson@freebsd.org>
Subject: Re: Helping to improve FreeBSD support
Message-ID: <ZseZLpuINSxGdIJZ@jeremy-HP-Z840-Workstation>
References: <tc6xfz3it47oxa224ert4fs2u36h3qefm2elc64kugofrujk4t@vh2wevz6y6qc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <tc6xfz3it47oxa224ert4fs2u36h3qefm2elc64kugofrujk4t@vh2wevz6y6qc>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jul 17, 2024 at 08:54:20PM -0700, John Hixson via samba-technical wrote:
>Howdy!
>
>Would Samba be interested in better FreeBSD support? I am reaching out
>on behalf of the FreeBSD Foundation. We would like to help improve
>support in whatever way we can. What needs to happen?
>
>For starters, I would like to help get as many of our port patches
>upstreamed as possible. I would also be interested in helping out in
>areas that are specific to FreeBSD. It would also be nice to have some
>CI setup.
>
>Interested? Where to go from here?

Very interested. Please send the port patches upstream !

