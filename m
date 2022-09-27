Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D085ECFAA
	for <lists+samba-technical@lfdr.de>; Tue, 27 Sep 2022 23:58:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=9AENIiwAcDKK260ripmU2lBGyqgmAlGYu5GsfeZItKo=; b=z/7OZQ4OeGgJucYuI7z8FAzKph
	nlDpQ3uCWRGGt98WEn7QreRWJ3srkamzQEkkjwqv1P+FhR7MtkXRC+CZr/uQuvJCedue+I4ll7Xo3
	4Io72yikAeohvx1ZwVGx35EQi/MkWuYJm8fQzeniFwCtDAln7OYpG2Y6zauY1x7KdN2F8IllTTivc
	VKedWJ4WgASQdOz4jWYwBXAMl9dJEzun4y+rx+nCSkYnfnma0sYeZlKu8EsKpGwbazwNbPuyMmH7i
	LduUQ4jp7MS2lfzrp2Vqx2J2iOL/XbvhOhgYSfB6t5//mYaBt/jG1uvEJ7/utc6RZgNmUpr06J0Dc
	NIEgD6eg==;
Received: from ip6-localhost ([::1]:46958 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1odIbH-004UJo-Qs; Tue, 27 Sep 2022 21:58:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53960) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1odIbD-004UJf-Kc
 for samba-technical@lists.samba.org; Tue, 27 Sep 2022 21:58:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=9AENIiwAcDKK260ripmU2lBGyqgmAlGYu5GsfeZItKo=; b=xKFxgThh9ECtwx0DMfjNZcx2DT
 3cT/wict62KlTfOqVWyQguFUxFZzv7OXPKVS+6EOTqKJVya4Dq/DANTGpJfllQhYDyjVmOyviddqn
 WzrJF2K3jayXWWMwBE8/aXtXkhczJ+n5P89rJddXRJ9uNA7dw7B9QaZif/UavZVtsXJwjyAa8pFSO
 9J2/GEriITE+Gzaf76PNLNCkHsWRG7Z/IqYTY0g8JcCQwzldkPao9mwpErvzuPV0hPoeDLxNA2rZs
 c2VwM1PHQWyhO3dHnUUXud2pluafSQ+OiQDMo/frIPnrLgFRa4F3S+9AHM4yCdVgAu/Gyxsw+sa6q
 2t1N4l04EhkmKPKkBt9p3SOwxBR/JxKqqv+bpLa4/ra/m4ntsRlB5w2x5KD5QrwS/iSHzDcihzNh+
 lhIY0dDfcGHa7H/NWe+qNKvfGCZDdhuZn9YhUK4hGG6vfN4l/zB7voHgr64sy2PYrt3HcPh5ulGA1
 4D/PgSZ0HrvcnYb/mo9KnYhW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1odIbB-0029AE-Dj; Tue, 27 Sep 2022 21:58:41 +0000
Date: Tue, 27 Sep 2022 14:58:36 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
Message-ID: <YzNyDJ43AIAkUSTX@jeremy-acer>
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
 <d1cd76d317998a3dd4456e7877b3950901019c14.camel@samba.org>
 <YzNu47xX9+j0BLKH@jeremy-acer>
 <1074acc48316978ba1fc5af74c7cd486fbe2ce0c.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1074acc48316978ba1fc5af74c7cd486fbe2ce0c.camel@samba.org>
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
Cc: Daniel Kobras <kobras@puzzle-itc.de>,
 Michael Weiser <michael.weiser@atos.net>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 28, 2022 at 10:53:19AM +1300, Andrew Bartlett wrote:
>On Tue, 2022-09-27 at 14:45 -0700, Jeremy Allison wrote:
>> On Wed, Sep 28, 2022 at 10:37:41AM +1300, Andrew Bartlett via samba-
>> technical wrote:
>> > I honestly can't think of a way out of this that doesn't break
>> > something.
>>
>> What would it break ?
>
>Perhaps I spoke too strongly, what I meant was be a user-visible
>change, that could potentially break some unknown user.

Yes, true. But as below, I think the original code
exposing non-user EA's was the real bug. My fault
of course, as are most design errors in Samba :-).

>> What am I missing ? Under what circumstances would an
>> SMB3 client get or set a non-user namespace EA ?
>
>We are in agreement.  What I'm saying is that it seems to be a mistake,
>which can be observed externally, to have mapped other namespaces by
>simply stripping a prefix.

Yes ! +1. Exposing other namespaces was the original
bug. IMHO we should fix for 4.18.0 and announce now
this change is coming.

If someone *really* depends on this, we could have
an option to keep the original behavior.

But I really don't want to (add that option, that
is :-).

