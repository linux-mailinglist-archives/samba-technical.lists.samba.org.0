Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3209F2961CE
	for <lists+samba-technical@lfdr.de>; Thu, 22 Oct 2020 17:41:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1cLdxzxiyvsMnnipb2dcpEhNyufxMhzgYO+7XKg6xs0=; b=P5YZMcwhR5QdUhcrRj5HTI2x4A
	3eOKEdJz7tNpawD2WPFiVEr9pTcvM3rLoJmK/61DmmIJbICoj4rVBtI9VTMp9tCw7OqPyrifVARu2
	JJlpzSrvNs2N+bwPs1a8lcmVMFeOD7Z2RbiPRax0/wsDxbrxyvm9Id1hwwpjAaGVzyaQWDHmpZiWi
	XAAdueHsWKjxCLjEslWd3PlBnBneQIe4PolkZ9GZSmIWUxRTwgtVzyZ3ICNAbal6EtX3LJY1QycUD
	WEeGVA/IsYLj33GtwdQshOwl1NXRxnezjSF+UtcBIXAPvlyafOFDp9jdR9JjxQj5ixPvVZGm1NfhL
	eNyF+MpQ==;
Received: from ip6-localhost ([::1]:62158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kVciO-00DJ2p-Sr; Thu, 22 Oct 2020 15:41:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57104) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVciK-00DJ1M-6D; Thu, 22 Oct 2020 15:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=1cLdxzxiyvsMnnipb2dcpEhNyufxMhzgYO+7XKg6xs0=; b=IMmdoPq0l4zXH5fUa7FK/tXeHQ
 G0BMqwt9oozTcHnTGMh91j95qpAaI2ekJs0WKt1mkewUyHdTKEEvaN1QJtl2Z9qLbO2MDn8QUm00z
 fdBTcLxEW2bGKpGJ2ZDMmqX0R9Dc1fMyeQKmnNpqbk8mg0UM29Qc5Kqki2xRBF7rjy0IHJ3CEqUG9
 YP5dPQo9gkB3zgVuNm7TiWfKz4ZTGENij2/RlD3FhYEd2DNImrmpdq/thL2pftD3UiCx72EagBU0q
 2JJd75Bupq8D+fC6jG/4lJyQq0fXfO80VxP+D+0adJfy2i6NNB8etU8cEncINnKwEXHdjxIht9qJ2
 Eiyx5DMVt+yXKl1dCI1jjyd/9bFJfCkCFY2yikAPxv9AbD30H92JFjipDdyuMhPgBuRJ0YLFEkdCs
 d0Gpz9RHVjgceVwGdkyFJ/9nv5P8UE4VrKDjJJXgX/2zbORK3ibZc7GZafNGl+tCaZjk0Fau+/cNg
 CxGEjTmq9JllLXV6kJiKQS2b;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kVciJ-0003he-6E; Thu, 22 Oct 2020 15:41:15 +0000
Date: Thu, 22 Oct 2020 08:41:12 -0700
To: samba-technical@lists.samba.org, samba@lists.samba.org
Subject: Samba clarification around GPL and VFS modules.
Message-ID: <20201022154112.GC941511@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

People who follow Samba development may
have noticed the following commit that
just went into the Samba repo:

https://git.samba.org/?p=3Dsamba.git;a=3Dblob;f=3DVFS-License-clarification=
=2Etxt;h=3D6b67381cc20412456d7d01a0587c0d627254a2b8;hb=3D1262b13f4db9502c36=
579b7dd740d8002e0baac9

For people who don't read git (I'm assuming
that's everyone :-) it's a clarification
around GPL license boundaries and Samba
VFS modules we've been discussing within
the Team for a long while now.

Here's the text of the new file so people
can understand what we're doing here.

Hopefully this will make it much clearer
to OEMs and vendors using Samba where their
GPL requirements begin and end when extending
Samba to work with their own unique filesystem
technology.

Cheers,

Jeremy.

----------------------------------------------------
A clarification of the GNU GPL License boundary within the Samba
Virtual File System (VFS) layer.

Samba is licensed under the GNU GPL. All code committed to the Samba
project or creating a derived work must be either licensed under the
GNU GPL or a compatible license.

Samba has several plug-in interfaces where external code may be called
=66rom Samba GNU GPL licensed code. The most important of these is the
Samba VFS layer.

Samba VFS modules are intimately connected by header files and API
definitions to the part of the Samba code that provides file services,
and as such, code that implements a plug-in Samba VFS module must be
licensed under the GNU GPL or a compatible license.

However, Samba VFS modules may themselves call third-party external
libraries that are not part of the Samba project and are externally
developed and maintained.

As long as these third-party external libraries do not use any of the
Samba internal structure, APIs or interface definitions created by the
Samba project that are licensed under the GNU GPL then it is the view
of the Samba Team that such third-party external libraries called from
Samba VFS modules are not part of the Samba code and cannot be
considered a derived work of Samba for the purposes of GNU GPL
licensing. Thus such libraries are not required to be under the GNU
GPL or a GNU GPL compatible license.
----------------------------------------------------

