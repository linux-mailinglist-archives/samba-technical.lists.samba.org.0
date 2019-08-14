Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FAC8CA7F
	for <lists+samba-technical@lfdr.de>; Wed, 14 Aug 2019 06:44:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=DcdXk9DL5y9jXMMPRW+uG0sRX+yMSNrxY8ySeInbIT4=; b=LV6UqeMPk5yBqmWmOpTqj6mjis
	AA1Adzy4Ba6ccmHBTHMrCXpJWMUW5GVIJA+M7JddS7VJh52bXPkH6pDHWzEYwNHIZRjLag9PaWW0y
	E5T/kmB6oVa63XbLAldT4NtmR1Yjbn/nuA1mB7pwPtkbpK9alZ3oNJD6C0seaUdSg50emzBIr9ga/
	xlGLS4+IznZdyeFx2neX4CWByn8EWZEIG3xQzL0rMycEl8idUQTFsH+52fF7wDgdifDbj4KIvMLlh
	bid/sZ2GUStpC/zgmeNrIA6J+k5UGLfWGXErcIPDLLVGVM9L/aTZLO6A5Okjh4Fwm9HwDOJqAXfBe
	K4QBoGHw==;
Received: from localhost ([::1]:42346 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hxl93-006Eat-CR; Wed, 14 Aug 2019 04:44:21 +0000
Received: from ozlabs.org ([2401:3900:2:1::2]:44125) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hxl8v-006Eam-VT
 for samba-technical@lists.samba.org; Wed, 14 Aug 2019 04:44:18 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 467cRp1dmCz9sDQ;
 Wed, 14 Aug 2019 14:44:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1565757846; bh=F1HSHGQ7ExtGVuQ2Nz1RTNp+N5McVq37lTfhgGwTpLg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jZGcMhqON4OtczUzFtNuF6/qNPyhEkirmpyD/n/n4nn0zD26x75R5+MEprcweanMD
 xcSSVOGDjsm74W264ZmXm3bbsLQBfeVJoLcUb7dmgu6IgyXsMi47PWnNEijJmSx5qW
 4CRvy7Rv8pdq8mwn9Wq5l3+c/5XX3KxE7U4K2UpMAzkI9YBR0csXT5pnXuQk4vY+d2
 POVkPBL3lL7c4JiRl0ofot7Mu7AXcGzw/isyL4SlMUM+Ci2C3Z6cWk3WTTzMnJsyBV
 RFCBtGbtnqZzjpjqmPOUaD2xD27RzCbfLnOne09T8HQE4jYLXTytvVu6oETNHAqL28
 hln1DgiWB9Eeg==
Date: Wed, 14 Aug 2019 14:44:04 +1000
To: Amitay Isaacs <amitay@gmail.com>
Subject: Re: [PATCH] CTDB TCP transport connectivity fixes (bug 14084)
Message-ID: <20190814144404.484e9e45@martins.ozlabs.org>
In-Reply-To: <CAJ+X7mQRwy7Uwe4nAMKxxUgDno0HsJPxxj0_Lf48eOngo6EBaQ@mail.gmail.com>
References: <20190814135302.7cae603f@martins.ozlabs.org>
 <CAJ+X7mQRwy7Uwe4nAMKxxUgDno0HsJPxxj0_Lf48eOngo6EBaQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 14 Aug 2019 14:22:27 +1000, Amitay Isaacs <amitay@gmail.com>
wrote:

> On Wed, Aug 14, 2019 at 1:54 PM Martin Schwenke via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > Fix for:
> >
> >   https://bugzilla.samba.org/show_bug.cgi?id=14084
> >
> > The solution is to only mark nodes as connected when both incoming and
> > outgoing connections are up.
> >
> > Included in this pipeline:
> >
> >   https://gitlab.com/samba-team/devel/samba/pipelines/76265339
> >
> > Please review and maybe push...  
> 
> In the last patch, there is no need to add "node" element to "tnode".
> "tnode" already includes "ctdb" for upcalls.

It is needed to be able to easily pass the node as the argument to the
upcall.

However, you're right that:

  tnode->node->ctdb->upcalls->node_dead(tnode->node);

could just be:

  tnode->ctdb->upcalls->node_dead(tnode->node);

Do you want to tweak it or should I?

peace & happiness,
martin

