Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EB2B1F7FF
	for <lists+samba-technical@lfdr.de>; Sun, 10 Aug 2025 04:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hs00WR3WvCAPbQKsJo4JYqVzi/fOoSYjnmzb3uBJUks=; b=MBYmFBmiT3ypr3O92U50vEcGAV
	iW+jNVVRlnY2fi2/zpjDx0CC62m4KUuMKubG9P7CMiLUNe01fYJWBbE/GcXmmeJNaEppXX6xMF7EM
	Onn+aZlBhxIqJt/QDmknQ/op2mfikh0qBYPlbb/Wq4qdpqFVB15GNWZakIHb74e7ms9ih4N3LWDYB
	DM1uzWwbqsIorAaW0EyTuyugKqB+qxRAq0XTQjyW2FWsM8BTpMlU6ty6BjQkiRK0OJIeGQSJaRPrE
	AqlgOTK1wHM4Wq8f1OiL9wk8d+b2qAd8eYFCZFhY+LEAsU1cf+J+4mLSVUZg54/oe//uvLfVtyYco
	Qk2W19/A==;
Received: from ip6-localhost ([::1]:44618 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukvOH-00Env9-SY; Sun, 10 Aug 2025 02:02:29 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:50257) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukvOC-00Env2-NG
 for samba-technical@lists.samba.org; Sun, 10 Aug 2025 02:02:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202409; t=1754791336;
 bh=hs00WR3WvCAPbQKsJo4JYqVzi/fOoSYjnmzb3uBJUks=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jjjCRIm0LPSFeB7uh33ikG6BFB3TDJ1QPpUVxf4c+/XYekXU6vwiZUmwTAKV71XnP
 otqft2GKVlYVkOMAZ6iMnXTDsbqy6Y2Z64BDNlaWG5jOqLvWsJW6K7ufgvey88JYFk
 dmzGMs03cIi1WIOeNRHzFLA6c5Sr18bLtHzxqCxKs2XTYdpaoujPcaeum5WmN2Kw++
 6NNQCsCZWcoujHuQvBHCtJw5aK0kdZdNiP5F/03bm1/+MWK2+NhNmi5Gd2E5HJUp0D
 jmMvaRONyCG2HHvrMIVA8Ua/Zns9g96OPrdEUYgmlizbF7nw/L2qIcx87+pkZU8CKK
 sUZuMoAxnVN2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4c01HD5pHwz4x3q;
 Sun, 10 Aug 2025 12:02:16 +1000 (AEST)
Date: Sun, 10 Aug 2025 12:02:14 +1000
To: Jule Anger <janger@samba.org>
Subject: Re: 4.23.0 WHATSNEW entries missing
Message-ID: <20250810120214.40858ef2@martins.ozlabs.org>
In-Reply-To: <60902b9c-3b00-4f23-a590-68651036243c@samba.org>
References: <60902b9c-3b00-4f23-a590-68651036243c@samba.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Jule,

On Thu, 7 Aug 2025 17:34:02 +0200, Jule Anger via samba-technical
<samba-technical@lists.samba.org> wrote:

> the WHATSNEW for 4.23 looks pretty empty so far.
> If you have added or deleted a feature in the last six months, please 
> send me a description to be added to WHATSNEW.

Thanks for offering to do this via email!

NEW FEATURES/CHANGES
====================

...

CTDB changes
------------

* CTDB now supports loading tunables from
  /etc/ctdb/tunables.d/*.tunables, in addition to the standard
  /etc/ctdb/tunables.conf.  See the ctdb-tunables(7) manual page for
  more details.  Note that the above locations are examples - the
  actual location of these files will depend on compile time
  configuration.

  It isn't expected that many users will require a directory of tunables
  files, since most users do not need to change tunables from their
  default values.  However, this allows vendors to ship their required
  tunables settings (for example, in one or more files marked "do not
  edit") while still allowing local administrators to add their own
  tunables settings (in one or more separate files).

Thanks again!

peace & happiness,
martin

