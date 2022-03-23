Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A474E5AE6
	for <lists+samba-technical@lfdr.de>; Wed, 23 Mar 2022 22:51:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=5rTgYYh9UK4ylIoZ5JRjU+w0I7yCwJOmjhYyBBBAkWs=; b=MucgPIlEYRVIabTseY4+gUuQgQ
	YsbWFBm/FUzYQaiavTdKYb+pyZDPy5EPR1DZ7L0ZB2nSDzWIN6IS7uhccb2t4fqZLAsiACDFR+xpk
	v3ri33ut01FMyCIakTjfquhPFQ90MoowSV2R3Njsp60cudPloTsmvZihHaOibVXXNTlFbncvvNZsv
	W9wM5YlvF+0O+aezj8HdVO1sgP9J21exb/qHfPkeqlu/vRcgQhOoWDGlxFldObSYFCvOAxiwvIdRT
	WiKvym3d8eIWlOEm85FI9vHRhA1Dl5unBA2JXo2DxBiRRBct/x99SV2m78p2UbeYNHBGuNeGT2Bgg
	EWz//qtA==;
Received: from ip6-localhost ([::1]:61894 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nX8sn-004fkw-VF; Wed, 23 Mar 2022 21:51:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37812) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nX8sj-004fhX-VL
 for samba-technical@lists.samba.org; Wed, 23 Mar 2022 21:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=5rTgYYh9UK4ylIoZ5JRjU+w0I7yCwJOmjhYyBBBAkWs=; b=UwVXpnro3MWlAUJhibDMFllNau
 QzKz6WEfpv3gTYYoCH/JVdc0WB86yhvYt2xeQ1DzRdgAozH32CuXBQ/Nt8Oxafp3jTXEWMPWgA50F
 JwZgW/2xYTVtI5l74GLeNSGJDu+opInSarvS5tX8g4CZvvQYjfaoEF/YZL/GJV/sRqw96sgEQwqq4
 R0KVGzuJIA9PiyByn1X4x86/et9NRysPDJtYyuaRO32etPsEAHkHD7wQz2a7+PTckmj7Aew+ZIQTu
 BKR2ymx4nspopid3jQoDHN6JmxApDsn5e7Jv1haaPo7jraEKBqFb+S7B5H55ooRcw5UuUhoYYi9jy
 Tc18XeK+Lx5YJlcFFKbv3bEEyuP4ne3WyvbvFMZ6zPjCGSmpfXYCnDoPJ0x3L7hHRWVtHrIoA+hM4
 kX6hV1PW1q7+EbxCb0sN0FDna81v0pRLtAI0pMBHlwSQ9APecd2T0mx3kGRakdCtx6Zu5nAbJW0iw
 MNYxK9ozcMwpr+FmY3Udhstt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nX8sj-00378u-L1
 for samba-technical@lists.samba.org; Wed, 23 Mar 2022 21:51:05 +0000
Message-ID: <be695e607739913e530fb1c8a0ccc191ea8eefe0.camel@samba.org>
Subject: Re: getpwuid(13891) failed Failed to finalize nt token
To: samba-technical@lists.samba.org
Date: Wed, 23 Mar 2022 21:51:04 +0000
In-Reply-To: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
References: <HE1PR06MB314825C38C5FED0EFE6E2B76EE189@HE1PR06MB3148.eurprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2022-03-23 at 21:41 +0000, capricorn cap via samba-technical
wrote:
> Hi!
> I have joined  4.5.16-Debian to AD.
> sudo net ads testjoin
> Join is OK
> getent passwd works
> getent group works
> 
> But When I try to browse from windows computer then I get popup to
> enter username and password.
> Below is the log message.
> 
> Kerberos ticket principal name is [xyz@TP.NUTI.LOCAL]
> SID S-1-5-21-774976744-1476728229-930774774-3891 -> getpwuid(13891)
> failed
> Failed to map kerberos pac to server info (NT_STATUS_UNSUCCESSFUL)
> 
> Can anyone help me that what can be the solution to fix this issue.
> 
> Thanks

Is there some reason why you are still using Debian Stretch ?

Please post your smb.conf

Rowland



