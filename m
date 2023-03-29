Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 404F66CD389
	for <lists+samba-technical@lfdr.de>; Wed, 29 Mar 2023 09:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=cARI4hxA/NY6zwQcKk3Y5ZER2PocEUouDWm6z5MyRKU=; b=DdyuCMg6oVGF6fIgWJ/zhxP5+A
	VZdyNlGyNS0b14yXQPdOKaHV/NgIc6a39icZOyXauRXxHUpvFjbcCIn+b/Sx9KbT3fLbdQm8QmjGM
	f21dqSGdbaAij0yyy41k2pu4kLUsY65xNaz7Q2WzWrC9QLA4kussrRMhLRiLZoP3bbMg+qUOvRlEN
	wCi4LNvS38WAQdsfZxjNje/zEkBGUw/cksovt07pfwBeeY+cBzULGCcqSrigMx6N90qd+k6LkG8Pl
	poZBPPMfHWY+T9yQIEWXf3r+vxoOPWTUjTJBelY54WciNiT8X83+S454xB7SwBD8xIQSsBrsFpNry
	ZfR8B3KQ==;
Received: from ip6-localhost ([::1]:49840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1phQVG-005YqL-60; Wed, 29 Mar 2023 07:45:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61028) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1phQV5-005YqC-8I
 for samba-technical@lists.samba.org; Wed, 29 Mar 2023 07:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=cARI4hxA/NY6zwQcKk3Y5ZER2PocEUouDWm6z5MyRKU=; b=hkSlzgxgTaZXJnoHtc8qo34Eui
 bbZdDaxFyty0NMxfAv0kwXf3GzazJJ+pSx1Iqrl+RyAuSzabULAOE2R9BijyUv3IArgyxJ77dzuFW
 n+asW/pn0sALtgV6GHuzFypu0EDMg+s2VOSgFZfxxSdKXNBllhvZlOxN86hnv8knZSBggASwbPiTT
 jLY/737/3vn8/gVqfV7OquOn6rrJ1/LUWRJAKm5O3YZHVK3QPo1GGJwCMjIxIkXFXltMeTLR2wai4
 S4BQndHuamiBDuv6oSEAPFtWAKUW0npDon7aDws5JL3BDZb2EdQu/6uqVLTj0ThelZBSt6Y1vSIDX
 qVwQqhN22Z8fwTElxeh+tsG7Ii6pbCV3hoWA3iFIMnx0GYRTvs8TVCHt7vU6sAYe978zRjLna4jYh
 uz+ThT7AWDupUH9ZIV8JuuaChMTeBlsYQPOy80oXauu4FTbgcwgiuJQrj/fsdMJR//OAXS7cyJHmr
 9WbfsP9Ysd/owvvMJAowSWw4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1phQV2-0061nh-1l
 for samba-technical@lists.samba.org; Wed, 29 Mar 2023 07:45:40 +0000
To: samba-technical@lists.samba.org
Subject: smbget cmdline interface
Date: Wed, 29 Mar 2023 09:45:39 +0200
Message-ID: <4486220.LvFx2qVVIh@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

our smbget utility doesn't use the the common command line parser. It 
implemented an interface on its own. So it wasn't able to parse UPNs or 
DOMAIN/user correctly.

I've fixed it with:
https://gitlab.com/samba-team/samba/-/merge_requests/3005

However the question is if it should use the common command line parser. It 
would break the command line interface as several short options are already 
taken by the common command line parser and we could only provide the long 
names for those.

Best regards


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



