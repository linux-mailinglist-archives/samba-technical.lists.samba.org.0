Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1722576E9
	for <lists+samba-technical@lfdr.de>; Mon, 31 Aug 2020 11:52:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=pbcZubtclXLpWSH6OyKSzVrKG7aGiWfxavHlUdMC5O4=; b=gZ1h6Vs1SEFetZPjrXRnup7CCm
	mhNCmlWWHbufO+angnoNEOq6spQUQH3AwJ1cmb1HbDJKnpR2Yg8/T5mXgMUXLP1WL+KFn64FXq3yk
	NhsnWCO3J5nAOQjgQaiCiWSvSdwZVmxRd1aLjiPOaOtMPz0exLd/kBsO2Uh4Yk+vMZy0wyO9ybctM
	zlHkbdPzGO08PMRCz+2l9U6WCaXyT7KZjz0hwqGdVXIXE5Q9uP2TaDwHJ9F4jXSpKzukCmYBlcawn
	dWIbfWKnIFEWSScZJqAqcSWBF3GUNUoUb7NDv9C7IF1EAzxacgiKYPpkGQbqIDKF9XHbs+mkU81K6
	nI+zG9ng==;
Received: from localhost ([::1]:60792 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kCgUG-001QTX-A0; Mon, 31 Aug 2020 09:52:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24064) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kCgUB-001QTQ-8k
 for samba-technical@lists.samba.org; Mon, 31 Aug 2020 09:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=pbcZubtclXLpWSH6OyKSzVrKG7aGiWfxavHlUdMC5O4=; b=1eMJGn/NhEUR4zRabqu7HL7xuw
 Xkid4hGj6+LpsW9Gl7uABgA3JPq7EPUzJfXPtl51rhvrrSAH6rdkWipYBNyTl6/WG+ReaMeu8C8sf
 zu/09WfgsQJ0qBltUcYpJmFawO3uUidxDHC9Fa3Lf5OlSGuAimKesdBQy37Y0abdwIkBwPfNDMJxq
 wVFGR3g0NdrGMiQPOMP36p7Eip9orVvn7uxYPtxhno1bOISglfFL2jlHHdbt3G1XHThpNVKvBY/r+
 +JcTcHT6z0ydXbJye/TtojFmMUpMMmSy/i+dkpj8PrnzudYnvRq5S0T29RLg+3/6wv2d+PfDHyrDI
 Fngbk0fdweDmWxj8i9wxGauD3CmfNdvW/cdXgLofCP5BKh1oMpUfDISmyI+yn6MpqW3q9ujwibGgP
 hQk7MgLgP+ioQPHyVeE1uoWqJOh4FpWcO6qYaNdLMmvWxnQBf2jaiH8sJN0TuNpJLLjb4u58FfUjE
 w+4JnNZ2cmRUn0Roc6mrc7A4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kCgU9-00015n-MZ; Mon, 31 Aug 2020 09:52:22 +0000
Message-ID: <951676ca1d57de76f0a5494140ebdc985b607731.camel@samba.org>
Subject: Re: PATCH: make disabling of vfs_snapper consistent with our
 configure/build system
To: Karolin Seeger <kseeger@samba.org>, samba-technical@lists.samba.org
Date: Mon, 31 Aug 2020 21:52:17 +1200
In-Reply-To: <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org>
References: <20200710110737.GA1585556@sernet.de>
 <b4ea37e5-398d-c8d2-15e2-1a27f7655598@samba.org>
 <20200710114452.GB1572444@sernet.de>
 <54f90e98-9d7a-337e-defb-27fb756130fd@samba.org>
 <20200710194428.GA1596727@sernet.de>
 <63044415-9473-1572-2cd5-fa1fa5e012e1@samba.org>
 <20200720170142.1583649f@samba.org>
 <15eadeabe4d9fc23e9a311a51a007fa020781ccc.camel@samba.org>
 <20200812115841.GD272474@sernet.de>
 <38124182-985f-8a79-aa9a-1cbb2241dc3f@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2020-08-31 at 11:36 +0200, Karolin Seeger via samba-technical
wrote:
> 
> this is currently a blocker for 4.13.0, so we need a solution asap. Can
> we agree at least on a temporary workaround?
> Or on shippting 4.13.0 anyway?

I'm lost as to why this is blocking 4.13, can you give me the short
version?

My understanding is this:

I get that Björn would like to change our mostly-but-not-entirely
consistent position from 'all features on by default, turn them off if
they don't work for you' (since Waf was introduced) to 'auto-figure
what the system has' (what autoconf traditionally did).   

I also get that we have not been entirely consistent.

But we did Waf, and much of this change, back in Samba 4.0 so why is
this blocking the release at 4.13?

Andrew,

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



