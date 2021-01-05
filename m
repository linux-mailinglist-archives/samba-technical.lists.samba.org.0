Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 109932EA98D
	for <lists+samba-technical@lfdr.de>; Tue,  5 Jan 2021 12:10:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=rLf/aiTnKK5hzbqCNs6v/oYv9p52d8FylOzMynn5rFY=; b=paP7y3NpnIZN33fLflR/nuGZ6C
	e4gipoDw8GOY9ddZ/7UEyXDMlkEyteaArYuohnNGI9t1t44IxIgpR4TtL5U1aHpeeqG1Mta7ZtFSN
	ZP9oZOwjolm6xUlhtIjDP22t9N/J3ZmRSdDwPh5e4x8QUv23+UDQ149Wj+I8znX92y/eI5wij0sPh
	b3q/XfOXsMWD+yrIv6J3c1nBqJr2QqMKDlXTmv81aNPbbDeD5yDx5dMG2rqxufrmW/BvL1mA394TT
	8yjDVEAv5VvO/TRznq8eivDvFRr787JK3oIHy/iaKB4d0142KalL2LrmVjvRSpXSZiF70fsYfU2D0
	YoCJTvVw==;
Received: from ip6-localhost ([::1]:54566 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kwkE5-004sSk-H3; Tue, 05 Jan 2021 11:10:09 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:48881) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kwkDy-004sSc-GT
 for samba-technical@lists.samba.org; Tue, 05 Jan 2021 11:10:05 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1kwkDk-00065j-9S; Tue, 05 Jan 2021 12:09:48 +0100
Received: by intern.sernet.de
 id 1kwkDk-0002eY-5t; Tue, 05 Jan 2021 12:09:48 +0100
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>)
 id 1kwkDj-000A6v-Tv; Tue, 05 Jan 2021 12:09:47 +0100
Date: Tue, 5 Jan 2021 12:09:47 +0100
To: Nicolas Pinault <nicolasp@aaton.com>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
Message-ID: <20210105110947.GA36762@sernet.de>
Mail-Followup-To: Nicolas Pinault <nicolasp@aaton.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
 <20200812115841.GD272474@sernet.de>
 <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org>
 <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org>
 <aa86e306-0c2e-763c-bb4c-3ba9fc4a9d52@samba.org>
 <20200901104311.GB760902@sernet.de>
 <20200902112132.1f7f4c79@samba.org>
 <20200902095042.GA800820@sernet.de>
 <ca9ace0a-c543-afa8-76a1-6c8d09324b95@aaton.com>
 <0102017564f2bdba-e1f4056f-3d82-4a19-80a1-821e5820b7c4-000000@eu-west-1.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0102017564f2bdba-e1f4056f-3d82-4a19-80a1-821e5820b7c4-000000@eu-west-1.amazonses.com>
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2020-10-26 at 12:47 +0000 Nicolas Pinault via samba-technical sent off:
> Using --with-shared-modules=!vfs_snapper I get "bash: !vfs_snapper: 
> event not found"

this is becuase your shell interprets the "!", you need to quote it via \
there.

Björn

