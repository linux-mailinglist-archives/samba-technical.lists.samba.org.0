Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8CC25AD0E
	for <lists+samba-technical@lfdr.de>; Wed,  2 Sep 2020 16:28:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=exyZMsiEzSSwJAdaZmLcEo5I5kjKDPHJoogMeO8BKvE=; b=rjrs5TdPT5YgCUAnCk7i83ndUU
	ZFHlHSds4LwQLctqgMxuTlitK94WYBSgdFQBvj0m4oiX1TnOjXOlBkq78AYxJU5Volq9gJST3oaWg
	FEBPz5xnloNgMB489nE1XTHhoH4D9leY5z+J8hOGbfuX5kBjLQUkUA/0BpLXrVZYVsMdICZcNucAp
	xXXfZ5dXiYBw9FfwW0aj8wRtyPIoCvHzWxy87rAajU9JP7rTuKyscbWKX5+wvewEpZcJycLTkJ4TE
	8WjJzYijyYjyFVRqfEMM08ZTs4g33OSwrTiqBeJsK2FfvBQuaSasPPMhaVe5ZeTdx44LrCCwIyqLC
	WhVyYNew==;
Received: from localhost ([::1]:57676 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kDTkE-003Wyt-QH; Wed, 02 Sep 2020 14:28:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36730) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDTk9-003Wym-RH
 for samba-technical@lists.samba.org; Wed, 02 Sep 2020 14:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=exyZMsiEzSSwJAdaZmLcEo5I5kjKDPHJoogMeO8BKvE=; b=kJiWAoMIIcK45fCwx2s+4EVNfQ
 ttxUtSESiKvQ9+d6PfGcxmdcZZshXBzGR7lQxO+84aXi+rvL1hc6sHM86r29LBU14TMKkEAoIyagZ
 V7vHFKBeNAja7cK55ICGqHaBlllMifrE291hu21oluEcRV2Gp5MQ0HPVjrOlfRdjGtDA6uURRTbbh
 o+NUpgdAM9XB6ynFom0tvvRTe0sPLHJC6rQPLpoobaLo37qYXQtsASQWQQZH+WldN3MqL0DjtgHrB
 CxQdvNtQaN8t4JCXkUmmGHbp8GQN773Lsg7CxIjVzOYTPzp3e6Ci8OI0pYHfCr7/21VNYSV7Qosc7
 UmRCn+UwL3hwrcLwzRs4gwDcA9/ANUrXvtnLUtpecqbp5QydLVhWzpMbsBDNrUYZYCJCCoXina8h3
 Sz7yLnsmN3zAlHtvApxXFHPW7hliatvijVMOIMMOg3rqiD6Fq8IvjLcj5eFJMde5i7teHkPE8gJB6
 BKlRECP9obqobLt8S9Xizezv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kDTk9-0003qq-0U; Wed, 02 Sep 2020 14:28:09 +0000
Date: Wed, 2 Sep 2020 16:28:07 +0200
To: =?UTF-8?B?QmrDtnJu?= JACKE via samba-technical
 <samba-technical@lists.samba.org>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
Message-ID: <20200902162807.1c814148@samba.org>
In-Reply-To: <20200902113415.GC800820@sernet.de>
References: <20200720170142.1583649f@samba.org>
 <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
 <20200812115841.GD272474@sernet.de>
 <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org>
 <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org>
 <aa86e306-0c2e-763c-bb4c-3ba9fc4a9d52@samba.org>
 <20200901104311.GB760902@sernet.de>
 <20200902112132.1f7f4c79@samba.org>
 <20200902095042.GA800820@sernet.de>
 <20200902123648.6d8aa3a9@samba.org>
 <20200902113415.GC800820@sernet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: =?UTF-8?B?QmrDtnJu?= JACKE <bj@SerNet.DE>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2 Sep 2020 13:34:15 +0200, Bj=C3=B6rn JACKE via samba-technical wro=
te:

> thanks, that looks fine to me to solve this for 4.13. I also just tested =
that
> patch also with 4.13 on AIX.
>=20
> RB+ from me :-)

Thanks for the feedback Bj=C3=B6rn :-)
I had to make one further minor change to handle cases where all VFS
modules are static: shared_list['vfs'] -> shared_list.get('vfs', [])

Please take a look and I'll push it following your ack.

Cheers, David

