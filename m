Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D965B166E0B
	for <lists+samba-technical@lfdr.de>; Fri, 21 Feb 2020 04:47:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=CIaH0DqmHBNjpHmiSLNyqyVyvnJj/fxOqbCuXEsJSGE=; b=vwn/4X9P2YvJZrsOF3pl/xOYCp
	MaeRZMspeVFbMfiwRL9+wgtpQ8UGFjM8N2286B0/GvXZyUGHTDTXVGk/6Og4jOgQaXrzB2zXHqWvk
	siNmuqzmS0L43az6lNjfjeaU95z5pTCgxzBJK/VVbHqyoqrjY/n/u2JpfJFENIaiqa1psJDxamOCm
	PpIhXWfl0Xv3MlLcyReuB60USvNSGrKDBNIUDLsl2h4zq4SSICXWrpg9fY60SsqNHxDIpqI96fezD
	0bsuS0sMy9P2pH21SoOVrNLcj0M5kHf32Kry/FncmSduwQqihSRFYJVmXEF90eW/OQO46/MT9xmrN
	mvpqHJUw==;
Received: from localhost ([::1]:45954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j4zGc-00ArKz-Fq; Fri, 21 Feb 2020 03:46:18 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:47959 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j4zGX-00ArKs-U7
 for samba-technical@lists.samba.org; Fri, 21 Feb 2020 03:46:16 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48Ny6g6NgDz9sRs;
 Fri, 21 Feb 2020 14:46:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1582256763; bh=ca4Sq5D9a2WuFc1KLbob6Lq2vXD3lGzMhimfUsfso4s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SReaYHGJq2Ux/Wv4a22n8ZuXhgNs4PDDuTFbM8DAR3nf/DdDs+xuQdSnlc0eckhB7
 Q852x/ANYzHtj4zAjg3jCCqn6jHkv8GaYyjlJjYp0mvV2vw2WIHmENanP+URCU/d/7
 kggYE9OM7ThA/WU4ZlgUOEDdsKWJQtazIYjRjtAPD9CbPH1bZHL0S6qfeF1qlg790U
 k2GVYpxWIsxtdjqvavljf9G0ZnVmMU4t7O7HT5iihaQzFD6a0+x3nIJku3Ox0PO8TV
 ud6QbPmErsrPmBaUmR/um0cIeFVQxKayFgH9TNDhL8KdgZM3nHzYyTtoGNKIrV7bsI
 f+uVGACi380kA==
Date: Fri, 21 Feb 2020 14:45:58 +1100
To: =?UTF-8?B?6aOO5peg5ZCN?= <wuming_81@163.com>
Subject: Re: about doc of ctdb
Message-ID: <20200221144558.5e6f9914@martins.ozlabs.org>
In-Reply-To: <676e7866.55a7.170520a6ed8.Coremail.wuming_81@163.com>
References: <676e7866.55a7.170520a6ed8.Coremail.wuming_81@163.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Wuming,

On Mon, 17 Feb 2020 15:26:20 +0800 (CST), =E9=A3=8E=E6=97=A0=E5=90=8D via s=
amba-technical
<samba-technical@lists.samba.org> wrote:

>     sorry to bother  you again.

>     I have not found any doc on the implementation/desgin of ctdb. I
>     want to read the source code of ctdb, mybe do some debugs.

>     Is there some doc ? or how to find ?

There is some incomplete documentation in different places...

Wiki:

  https://wiki.samba.org/index.php/CTDB_database_design

  https://wiki.samba.org/index.php/CTDB_and_Clustered_Samba#Historical_and_=
Background_Information

Source tree:

  $ ls -1 ctdb/doc/*.txt
  ctdb/doc/cluster_mutex_helper.txt
  ctdb/doc/readonlyrecords.txt
  ctdb/doc/recovery-process.txt

I recent years Amitay Isaacs and I have given a series of talks about
CTDB development at the SambaXP conference (https://sambaxp.org/).
Many of the talks are linked to via

  https://wiki.samba.org/index.php/Presentations=20

Some of these talk are about future directions and some cover recent
development.

Some of this may not be up-to-date but the principle are mostly
unchanged...

If you can't find documentation about the part(s) of CTDB that you are
interested in then please ask again.  We would like to see more
developers working on CTDB!

peace & happiness,
martin

