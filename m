Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB86F2E89C3
	for <lists+samba-technical@lfdr.de>; Sun,  3 Jan 2021 02:25:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=IYoMenPQ75c9f3stiFW+Wo0tHXzrNB9ehkeehzlmNOs=; b=WdUdqb69fcJ5Ps6oVwfs0kBEhG
	qAvFyuQJLY52laURLjlXvMRkcxXksd7s9YAACN4mYh40IYMRJtg83qXTpBd53rFS7ff9Fd4UpiNUf
	CedgJ8JDkTpBmTkEsSS+svtrL5Vm8QXX1fmegpXeTKeBvVzqjaSWqw/TFvfhNhjSxJGqrlHEzRLTW
	5pYzNRnNKd/VgbLrSL7v44PIEDfToX9Gm+wRFatt1DqpRb9Jv63mcI3vZVz3Xwx/ugf+8h9TGVGa9
	+ILqm0MqqXve4UFdryTC+vZEIs2Okv7dkMMWZusK5/YqlKF2JSqZtFrNUgZAWwM86ATKHgnK5n07V
	sHiLBydw==;
Received: from ip6-localhost ([::1]:31646 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kvs94-004bzP-K5; Sun, 03 Jan 2021 01:25:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31128) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvs8x-004bzI-Bd
 for samba-technical@lists.samba.org; Sun, 03 Jan 2021 01:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=IYoMenPQ75c9f3stiFW+Wo0tHXzrNB9ehkeehzlmNOs=; b=fw994qPbX1hEQsFBq3eOeHFyos
 tZnUm8UhfwGgN07DXben1oG7G/MXfmGKGD2I0BBDEECf/jgikoK40+HnT2g5W2aQuAqJUjd95/7+L
 YgpziV1lSdZTbl6nU9338eHuNnzAtyJCX8OU6fJVZ4NKYeXa76unAm47WIlDYNpIoI94E0s2fKK/e
 3iCQ3Z0yVj3LgVWHbs6exWV1DDZqfEgFnyCIP5DwpJu9Mg6e0aZod1n4nKD3VLwUejHoFaikFxK3s
 DOYyOKnHBx4cXpRv07KJs/JBqMPvVG46npqck0P2annqZXRlY09jHVrXMzUYhbvY1Pxn+vNwCEno3
 DXw+SVXUVZwLuOH3h7gUHvGj6B9kEvFqAE9/7a04AK3dLoGDhT5QD0j//igx+jdwazE3HW3baG3mE
 R4UsgLj65NcQ8WcsslYM3G0H66Zzgg7TbB9Lm8zCOi84uSvYk2CLw8iRtb/ZUJgapp7dh5YSQw9PO
 lrqd4Zw1a56HCO8FDuCPS954;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kvs8w-00055d-1J; Sun, 03 Jan 2021 01:25:14 +0000
Date: Sat, 2 Jan 2021 17:25:11 -0800
To: Steve French <smfrench@gmail.com>, Xiaoli Feng <xifeng@redhat.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Subject: Re: [PATCH][SMB3] allow files to be created with backslash in file
 name
Message-ID: <20210103012511.GC117067@jeremy-acer>
References: <CAH2r5msH3LZuF69UFcfgtG7XXurMDc=-Ab7Ct4XwfARR8d+wRA@mail.gmail.com>
 <20210101060050.GA1892237@jeremy-acer>
 <CAH2r5mt+5LQB59w0SPEp2Q-9ZZ2PV=XDMtGpy2pedhF8eKif0A@mail.gmail.com>
 <20210101195821.GA41555@jeremy-acer>
 <CAH2r5mvt_cHDbT0xaeLNQn=5cQ0T2-wPgpMkYEGQNdtDZ3kP=A@mail.gmail.com>
 <20210102025837.GA61433@jeremy-acer>
 <CAH2r5ms1V2KKb6T3ELQ-JsQ3fniOScTE2654_xLwnPruiekzEw@mail.gmail.com>
 <20210102052524.GA67422@jeremy-acer>
 <CAH2r5msZt0UZG5r5Z7=_jQf=-xgNz8zW7fZOnqncqeJHB=mOmA@mail.gmail.com>
 <20210103012116.GA117067@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210103012116.GA117067@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Jan 02, 2021 at 05:21:16PM -0800, Jeremy Allison via samba-technical wrote:
>On Sat, Jan 02, 2021 at 06:19:39PM -0600, Steve French wrote:
>>I agree with the idea of being safe (in the smbclient in this case),
>>and not returning potentially dangerous file names (even if a very
>>remote danger to the tool, smbclient in this case), but I am not
>>convinced that the "user friendly" behavior is to reject the names
>>with the rather confusing message - especially as it would mean that
>>inserting a single file with an odd name into a server could make the
>>whole share unusable for smbclient (e.g. in a backup scenario).  I

FYI, as I pointed out this only happens if you *explicitly*
set a server parameter that is only expected to be set on
a share with "clean" (no non-Windows) names.

So just creating a file containing : \ etc. doesn't do
this - you have to misconfigure the server FIRST.

