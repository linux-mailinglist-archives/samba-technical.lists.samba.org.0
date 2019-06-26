Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 208D75732E
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 22:55:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=x7M9yhQD2IgSWGoV/bfZuv7z3AYNj57jUMTJgqP9kRI=; b=SQr88yjZH6UsYEiYvXhyHby8/+
	QdsHOS8JT4SQGoTnpNGDr43QIZ5KzjRYr469yE6dfk9Hts2qWih8fvMmXdyuy0QFkkHl8692vmTcE
	KerQcDs7NSsRyFa/PXYoWlwN9HYgPl8k9hDCNEaLNXBAltT8d+OdyN2Wa9Bsa1cFA/kvGu0BeGOuZ
	tp6y1gHpslqzTyLTMkw/mjzIcQtH/EXhSxLU52f2QFNEIn+6efxJIivlg2/mc8SfB5wM8SawWxDqr
	SFAfNSB/0Alhg2JLmXM1eqB5h1tn7sBfZIlXij18jbkMd09VwusFRQy2i0RRNOdIuff2FZ5qzoRWu
	FPzY7pGw==;
Received: from localhost ([::1]:28304 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgExI-0021Sl-Hg; Wed, 26 Jun 2019 20:55:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19708) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgExE-0021Se-Ve
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 20:55:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=x7M9yhQD2IgSWGoV/bfZuv7z3AYNj57jUMTJgqP9kRI=; b=XJUAwg7rAL31gUH3XvV8bGnm04
 DbEihNJdPRTSgbdiIx3tF3Ic9TQO0MZUziSawSj0wN9/zvH5+4/6sKPCgBDPmGjhj99FrqVtYBb7B
 //tfvtYsXejSNI46QbExUI0jBxhR0Wr2aMqrXoJjJTfV1FRtyTWI1iI6lFK8R+fXbF4Y=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgExD-00054W-Sf; Wed, 26 Jun 2019 20:55:44 +0000
Date: Wed, 26 Jun 2019 13:55:40 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: [HEADS-UP] Using stored immutable file birth time for SMB File-ID
Message-ID: <20190626205540.GB15143@jeremy-ThinkPad-X1>
References: <20190626135745.lk7757wmy26pgy26@inti>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626135745.lk7757wmy26pgy26@inti>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Stefan Metzmacher <metze@samba.org>,
 Volker Lendecke <Volker.Lendecke@SerNet.DE>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 26, 2019 at 03:57:46PM +0200, Ralph Boehme wrote:
> Hi all,
> 
> in short:
> 
> Samba will adapt a new File-ID generation scheme, based on a file's initial
> creation date instead of using the file's inode number.

This looks like a good change to me. Decoupling the
inode from the FileID returned to the client is a
good idea, and may help us with problems with sub-mounts
being exported from the same share (I think we're
already good here, but I like this solution better).

