Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5955F79AE
	for <lists+samba-technical@lfdr.de>; Fri,  7 Oct 2022 16:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=0o5qvKO7YYGH894CJPSJKLBy5H+zblBlPd40mBM55Ww=; b=UO+oUwMyzSXYJ2VsiGfLgsjCNy
	IFmxIXfT+sZsa6B8Rx2gUGj0abv77BAOwxyVuI5W187k+Hggsr+yloNJV4yXw/yGzYo+OKB5Kaiv2
	YJPQFsIEj3YKCa0AidiRV7Cu+iXaEliFW0hz6Jd57PvAouaC8jrKnK7WDGSZ4HTwAXW2OoRgCF4cO
	eShQPj0AGndbEc+q2whRS9JZULCiXkMQWkLMGmGJtzZvizv4cXVKN6bp5gtIDLeh1d0iQ1Zj071qZ
	bsqFmS+Csq9sXeddXFPYNa20jHkrIpHdefsowykXuVdYjzuNMWItj7AhzVYaLedtK8Xg+hfhPnDt9
	v+139HnQ==;
Received: from ip6-localhost ([::1]:49308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ogoI5-000ZxA-C5; Fri, 07 Oct 2022 14:25:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63048) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ogoHx-000Zx1-7M
 for samba-technical@lists.samba.org; Fri, 07 Oct 2022 14:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=0o5qvKO7YYGH894CJPSJKLBy5H+zblBlPd40mBM55Ww=; b=KtT2i2CuWB0auL9QtKMJbUbENV
 NURYbBiEz/OoCIN5zHWC6bvdoWnXEJzJck0592ugK1gGqL+dcqYFYKO9/ZOpPsewtUZQ3kKimzdt2
 fhmk8LRJ7XI87TxZIZU0mbJSaQhhgwR4suFchhh8qJ20bKG6PSl4L5g3nXdhNqOvFH+s3VeY0Z19s
 BKIm1wSfpLIvd85VA/3H0FLOFnPZDgTwLyZboaN8CmJKMW7oqMieuJ5x3BTST+CKoRoTzq3Ysdf6X
 BoX8/PGj3OV+Dg9B1SU80wbeR8tjUiJsrWlZnoFZlTOXkbomdsr5a4KDh5Ep0OMstys9iGspDZ8od
 an4hhHGYMh+Pfe/t0HPXa6wP5/48ueaNE87Z6KB8whSLxScvB5Vbbo9htD5IrfHSZxwoC6w/Fop/g
 hwRJVBCbGcPfu7AVhU5+PZaZSmlj6VyioMbuCweChiVDEMN0U5HloVvwrnvKr+fSqnt1sNdZcI7qW
 i2K5BFJAm/ewBVOdil4GPoeY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ogoHw-003OYL-8A; Fri, 07 Oct 2022 14:25:20 +0000
Message-ID: <533a1bb4-706e-6839-cf14-5db3a183aca8@samba.org>
Date: Fri, 7 Oct 2022 16:25:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: vfs_crossrename not working in samba-4.15.*
Content-Language: en-US
To: Ralph Boehme <slow@samba.org>
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
 <CAB5c7xrru41LZs76Qy9wdT6gXbWkWsEi9oyzKMY_Ux_eqw+LgQ@mail.gmail.com>
 <Yz8WfqhSldLLC7RX@jeremy-acer>
 <a27d14e4-ba5d-901a-60b9-2e2b7c7350ca@samba.org>
 <5f314f80-e29a-323b-b349-ed806d5f3bb7@samba.org>
In-Reply-To: <5f314f80-e29a-323b-b349-ed806d5f3bb7@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
From: =?utf-8?q?Pavel_Filipensk=C3=BD_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I believe that the bug was introduced in

5c18f07 2021-06-16 21:01 -0700 Jeremy Allison     o s3: VFS: 
crossrename. Use real dirfsp for SMB_VFS_RENAMEAT()


which removes

-       if (unlink (dest) && errno != ENOENT) {

and adss


+       ret = SMB_VFS_NEXT_UNLINKAT(handle,..
+       if (ret == -1) {

=====

I am trying to fix it in master via reintroducing 'errno != ENOENT' but 
the fix panics in _share_mode_entry_prepare_lock()

...




On 10/7/22 15:41, Ralph Boehme wrote:
> () is only in master, so how comes you have this in a SBT from 4.15?
>
> -slow

