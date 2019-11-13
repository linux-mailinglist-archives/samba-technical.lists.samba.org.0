Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF18FAE67
	for <lists+samba-technical@lfdr.de>; Wed, 13 Nov 2019 11:25:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=SmgMZ3itDpKZJedayJ1J4NvoXYd2hSV2RhMS68QnlPY=; b=v7CDNkJ8PvFySLjVhrBwsXaF/P
	bBuT/1QBtlNwcfE2oFZddPIMkDqB5LQOKcySSxqIOIR+Lqxz/PNagtE1F20synqodNjDF654r10Hs
	ywVMEwY1pP/XlpIQppNJ347E9NSgKo3FSkIeMQJO9zbYjmmU8F/ddgZHIjwTqKfmUCnGNyt9qIclb
	ArCMd8f7N1fIZyW4BEeFsv70ogQNgFrhHBb/dDiR5xFM2r25fncMEdariPThaZ2030DFEgwkXwUfo
	7tUbcrqgRKSljfRGP38AS9mRuQDq32bL+NLAoHAYUhte4xyNWkBmlt110FTGjVHQOox+ulo6h1qyS
	Rnt+1U8Q==;
Received: from localhost ([::1]:53864 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iUppc-0004fm-2u; Wed, 13 Nov 2019 10:25:00 +0000
Received: from [185.16.48.59] (port=40796 helo=smtp.tranquil.it) 
 by hr1.samba.org with esmtp (Exim) id 1iUppX-0004fe-9s
 for samba-technical@lists.samba.org; Wed, 13 Nov 2019 10:24:57 +0000
Received: from mail.tranquil.it (mail.tranquil.it [185.16.48.58])
 by smtp.tranquil.it (Postfix) with ESMTPS id 93013401F0
 for <samba-technical@lists.samba.org>; Wed, 13 Nov 2019 11:24:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tranquil.it; s=mail;
 t=1573640692; bh=SmgMZ3itDpKZJedayJ1J4NvoXYd2hSV2RhMS68QnlPY=;
 h=From:Subject:To:Date;
 b=BE2ysrWLnsJkXeQxpLzNFOm1p+Ld9Hd8QEmSiMqf476kdwBxwATQbjr8pKewCw4i+
 VazhqeJfs8kj9l65lC4HTcM7iBeWWtiBQXfzhAQJAmmeAOlKWdZWk7hy5CPpbuXvDd
 vWz/uCIo9sZoqWA9NYy8adKKqjCxNf+3+qqDH7Z4=
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id 8C3FC96
 for <samba-technical@lists.samba.org>; Wed, 13 Nov 2019 11:25:09 +0100 (CET)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id jlFTp0hrlu8M; Wed, 13 Nov 2019 11:25:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id F22FE97;
 Wed, 13 Nov 2019 11:25:08 +0100 (CET)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3K4Cd-H0S-UK; Wed, 13 Nov 2019 11:25:08 +0100 (CET)
Received: from srvlts1.ad.tranquil.it (bureau-sdsl.tranquil.it [185.16.50.4])
 by mail.tranquil.it (Postfix) with ESMTPSA id D90FF96;
 Wed, 13 Nov 2019 11:25:08 +0100 (CET)
Subject: feedback on ldap improvement in samba 4.11
To: Samba Technical <samba-technical@lists.samba.org>
Message-ID: <4ac9eeeb-211b-ca35-d234-6648c612ce3d@tranquil.it>
Date: Wed, 13 Nov 2019 11:24:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
From: Denis Cardon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Denis Cardon <dcardon@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi everyone,

I just wanted to say how impressed I was with the improvement in memory=20
handling in ldap server in samba 4.11 that were announced in the changelo=
g.

I was doing some debug on OOMKiller issues on a Samba-AD 4.9 with a=20
large database in production. There are some buggy softwares that make=20
queries for all users (the most peculiar one I have seen is a print=20
driver...) and Samba 4.9 properly handles the query but allocate around=20
2GiB RAM for the query while the client downloads the result. With a=20
handfull of such queries piling up it can quickly run the server out of=20
memory.

On the other hand with Samba-4.11 memory is allocated in a much more=20
frugal way and it can handle hundred of such buggy queries without=20
crashing (it may be slow but it does not crash). So kudos the Catalyst=20
dev team for that great piece of work!

About the prefork model, the master ldap process is properly restarting=20
the child process after a SIGTERM but it is not restarting after a=20
SIGKILL. Is it normal?

Cheers,

Denis

--=20
Denis Cardon
Tranquil IT
12 avenue Jules Verne (Bat. A)
44230 Saint S=C3=A9bastien sur Loire (FRANCE)
tel : +33 (0) 240 975 755
http://www.tranquil.it

Tranquil IT recrute! https://www.tranquil.it/nous-rejoindre/
Samba install wiki for Frenchies : https://dev.tranquil.it
WAPT, software deployment made easy : https://wapt.fr

