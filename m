Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 819B560BB53
	for <lists+samba-technical@lfdr.de>; Mon, 24 Oct 2022 22:56:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=wxRvx4GtdJ/exb9h0M/QkKJdhSa2P1/zXmw+WxBOVD4=; b=qCPZOL6WdBQb7g1WfM5JdAEDtB
	Dmj/KuaUXjkLYxk4/eILJOMnB3CESw4ZgvyzSBK89nyDdJUJUDYjoALkycYQvb5fCZTuE1z9jdW2W
	djvqlFVRbIaCelGdvUyrrGZHhzPDGZJ7E1VvaO6PsAf+x1LeBUc4T/3TmJBtTiX36hEfjgZ1/EEZN
	pEyVdmgCagdAvx7hHzTOXP5GnUHKO2pAlINu+HDpfrz46vE9f+gTnqvHPws1AOrGJPtjzBaIYIU8t
	Hvdx1D1rkm39YFv3V0xZEfNJTfa9ArTBvfX9rXoCOGMi/bPv6YdobIP4KaV9gV2BYBnWkiYbv8OrL
	NNuVp0nw==;
Received: from ip6-localhost ([::1]:23480 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1on4Tv-005Z3i-8A; Mon, 24 Oct 2022 20:55:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58654) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1on4Tp-005Z3Z-VD
 for samba-technical@lists.samba.org; Mon, 24 Oct 2022 20:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=wxRvx4GtdJ/exb9h0M/QkKJdhSa2P1/zXmw+WxBOVD4=; b=bTozQbmmPg2YPukzrN4xfU3h8P
 DdmZL1C+VEATFvXEe4IqtxEvMs9QJNaZVczKqyfA9W8UFaJiOvlfYuz5DroX9MfmGvSNbdBxHml1z
 bGdcKTlWXcchA8ADJcNO9NfBQSWm4SXlN3wgotFpFcuFy3I/wZUJE1C+cAUncSAflXZWCgVpSxykl
 1/qdOyBMHSWsLYTFH5rmOSrEV8HnLm9IIi6fBYN+piNqIZpte4rXRkul//uo92BLb6wY6+aO5hqi0
 O1yXGebzDTGZ9L55vuWeQG1EXHAqjfXAjrPCAR/tHU9p1gHAB5N2qy/Xed8CvEwUYr2GWh/dyaEH5
 e98ufnrEDS5sPJuTYo95imQUGU8lIwp+MQy2Lm2avb7a3861o4fwne1cV55KDTKwUBg60vHfD7xa2
 vvqzpMWdkOcHixAvvoIZMNIvg8qlv86pHMGch4vD92WK8p1ESQWylH5k6Aeq9aHSavJDfF0dsUWDS
 1DyY9Vl7GOryP9NE+ZGGLmiF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1on4To-005aBv-JC; Mon, 24 Oct 2022 20:55:28 +0000
Date: Mon, 24 Oct 2022 13:55:26 -0700
To: Pavel =?iso-8859-1?Q?Filipensk=FD?= <pfilipensky@samba.org>
Subject: Re: [ANNOUNCE] priv_wrapper initial release 1.0.0 ready for download
Message-ID: <Y1b7vgm43+FIJ72t@jeremy-acer>
References: <8008015e-90e4-1db9-202c-8f3d6582e46c@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8008015e-90e4-1db9-202c-8f3d6582e46c@samba.org>
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

On Mon, Oct 24, 2022 at 01:38:12PM +0200, Pavel Filipenský via samba-technical wrote:
>The new priv_wrapper library  (version 1.0.0)  is released today.
>
>It can be used to disable resource limits and other privilege dropping 
>(allows to disable chroot, prctl, pledge and setrlmit system calls.)
>
>Home page:
>
>https://cwrap.org/priv_wrapper.html
>
>Download link:
>
>https://download.samba.org/pub/cwrap
>
>
>Thanks to Pavel Filipenský, Nikos Mavrogiannopoulos and Andreas Schneider.

Great work you guys ! That should help a lot in improving testing
on more security-focussed systems.

