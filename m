Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0804B485EE4
	for <lists+samba-technical@lfdr.de>; Thu,  6 Jan 2022 03:43:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=RF57lH9vXa6dEwG7I7ka7Qj7KALqc9VxA03Yk5T4SkI=; b=XGjDogw1TuNE56SiH+8RKeCKpD
	XuiAqMCDWGl4vTR+TQAMLwPw9EEU9Hz3A5Cspf48EopNx9qbCMiU12G9AO16W06LCzXbrH8x7kzoy
	WGoIL1yO05oLUtD/wbPDD2Q1s3ClaZSn7OIUlKJ2Q7sgczaneU+nR0Ce8+cAH9Q0kyn6nj+afYyZd
	AK3NXCMMoGNCiogkHHXkAbMeZwvlz9zCRe5e1axQYKHyAssdcdJsMIIm2qD5x5w4rd3r7M1XudcTS
	OTGctNSFrYacGeZfDvhZKty+c3uKTns6xQHMqWiIEBVLjPGkM0TAicfspmj99PDZyRFI9UsWR9gq3
	JegzeQIg==;
Received: from ip6-localhost ([::1]:52576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n5Ij7-005A6W-14; Thu, 06 Jan 2022 02:42:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54736) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n5Ij2-005A6N-ML
 for samba-technical@lists.samba.org; Thu, 06 Jan 2022 02:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=RF57lH9vXa6dEwG7I7ka7Qj7KALqc9VxA03Yk5T4SkI=; b=2GfZ1I9jkMmkbcdSfnu3yHIVRS
 P9mrdEsa8rD22LVTZFF9MHQRkAivBTHczQUWgGHPDJiZBUen36n0BorQTBqYb0RFBbFDip3SocxZU
 kzrYhW1ssuggdMjy81PibqtCyP4cr8rHF4jtB+9WEZtyyL9o3l+ue8188UyTx17PyYYsRfcYTw4ww
 jZt5HMKiKr1/BTOyZPTyW5Z8hD1E84K4ScTGnQOllnXW/LWPaGrJXoYT6eW6tkZ0Gcwct+gcun5mS
 LPfTMf8UMbZod57gnaRjWLZuGYGaKNjDXRXobXAfHEZyD6l0UoUE0w1X+zpzf3PRRIFKQ/VMb048z
 UBfmpgwr2/f9Cp3AnCbM/LhoHqlviUY7Au/4V5Q08zg0YcmPfv3wWUu/P7cschjWW/3QpP/kqn04x
 Fn1a/DKX7T7SMImMaQKarCuH/9LkF7d6upf1Reprsv4C5nPsHyf1E/DyUHWTDobGn85Ut32QBCHPY
 wZsHktZg6Ki4L2YXBOVUsaag;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1n5Ij0-005xgB-AD; Thu, 06 Jan 2022 02:41:58 +0000
Date: Wed, 5 Jan 2022 18:41:54 -0800
To: Orion <orion@et.byu.edu>
Subject: Re: Unbecome Root in VFS Module
Message-ID: <YdZW8mY5liRL+TDN@jeremy-acer>
References: <f48481ea-1c2c-51fc-89a3-c7c81b97e48d@et.byu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <f48481ea-1c2c-51fc-89a3-c7c81b97e48d@et.byu.edu>
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

On Wed, Jan 05, 2022 at 02:56:58PM -0700, Orion via samba-technical wrote:
>Hello,
>
>While adding NFS RQUOTA V2 support to Samba, the request is being made 
>as root and is thus root squashed by the server and fails.
>
>The reason for the issue is source3/smbd/quotas.c executing 
>become_root() before calling the VFS module.
>
>I tried calling unbecome_root() within the module, but it did not 
>work.

It most certainly should work - if you notice, it's
very common for Samba to do:

become_root()
... do privileged operation..
unbecome_root()

>Is there another way to change back to normal UID/GID from 
>within the VFS module?

Explain "but it did not work" more completely please :-).

