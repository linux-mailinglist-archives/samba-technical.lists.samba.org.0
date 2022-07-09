Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AA756C797
	for <lists+samba-technical@lfdr.de>; Sat,  9 Jul 2022 08:48:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=UDZZn7VxPO45+HGDOFYESqdDZm1B3TdvDlVcAnuqaow=; b=mcLGZiHvVG2QnL9qJkQVGXnWK9
	9elFU/yZnVD6Bk0hygEjM77DOrQtif3JmectN8KFETS1ZfOhNlMkLNk8J5qVGu59RMRjinkNvjjwr
	MQqSy6MDf9zKtdZqhNi3mDyXx7hO4fAh/nLA8RK+HazAyyiyRNBuNlgoQx6kNS1QRHlKSn1dp21MO
	ySKDcJvXgWCyBM8QYJelupPDm1Rvoa4VbM5xjyyKSBnzHHMntS2m61rDOCxj8LAtPExGKZqW1CZ15
	zMfK8ryDf2bRWWwd2sOgCIGXFTkDLophJzjo5c/qHzykRtNPHmDGIClMBvQ/Yq7z9GhG10zVsaqWf
	NqwdxVRw==;
Received: from ip6-localhost ([::1]:44186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oA4FB-00GkVx-W3; Sat, 09 Jul 2022 06:47:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17440) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oA4Er-00GkUG-6D
 for samba-technical@lists.samba.org; Sat, 09 Jul 2022 06:46:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=UDZZn7VxPO45+HGDOFYESqdDZm1B3TdvDlVcAnuqaow=; b=YuzoWYIXB0fi4xfLteC4X3AaIS
 F2ak57tbnZdGoor7CjUd9Q7XBxxFk2Y0DhCbUo0+PAO/HSbAoXd7y5x01Y3uOnM5BWUHL5joDwsrH
 r6aJ4YHG81NAlg+QKchVp+OH8QEzbrKLNY+YiSVe3ira8Tfkw5xUm9mFEJLC0nbIc2u38KJjEeR+X
 mO26rmuK+cwSLaPQa0nhh+egVTwWkKVfepML1vptAgkZ85cG/9HVkuIt5rqIvwP+/U/ZUwDSg4PTH
 AEKsRqoLf5eOwB3KLTQOIxx9D3i0F8EMW6aHJxhsTb5ZqPXvKfLpdIr5xxltMtpbTGlNZG6fmEpzy
 Av0ALVak7gNu51KPhTZGcdIahbtQkhsT0297T1QqM+KZu0W417bZKiMTRZqIabBHxH6OATKO7IyE1
 R4haZbl8/fkbk2wNpWjx4eMOcHBdZH3SnWvRZONymF4EoipQMRjbLgfdB+b7XNhaJrQjj5axewKA7
 8sK/idCHW5UaRNiLmjq3pCDc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oA4Ed-003qSe-5h; Sat, 09 Jul 2022 06:46:35 +0000
Message-ID: <04cd9526caa11ac094fe6b276113639e46177aa4.camel@samba.org>
Subject: Video of my Kawaiicon talk: The "Dollar Ticket Attack" on AD and
 Linux Kerberos clients
To: samba-technical@lists.samba.org, krbdev@mit.edu
Date: Sat, 09 Jul 2022 18:46:31 +1200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 (3.44.3-1.fc36) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Alexander Bokovoy <ab@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was going to wait until a per-talk video was hosted by the organisers
of the conference, but in the meantime this link into the live stream
works.

I'm sharing this as I wanted to share the video as folks have been
interested.=20

https://youtu.be/4hBLf2vQc8k?t=3D30560

It would be great if the linux side could become harder to exploit at
some point, I have some suggestions at the end of the talk, and Sumit
has had some suggestions around disabling an 'a2ln' plugin.=20

It would be good if someone could write up some good guidance for users
on how best to defend against it on the Linux side, both with a 'simple
keytab on server', or 'samba publishing keytab' or other similar
configurations.

I also tell the tale of how I broke into Windows AD last November,
similar to but more punchy than SambaXP talk, which I think was pretty
cool.=20

Anyway, enjoy and be worried!

Andrew Bartlett

--=20
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba


