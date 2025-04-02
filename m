Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9033CA78F9D
	for <lists+samba-technical@lfdr.de>; Wed,  2 Apr 2025 15:21:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=fpqFrssur8XwzaX61qKCU1rsBl9PXbyHjQbc2KbZiY0=; b=VThqfaqFLJBw1IcTxsZ2JUN12B
	3OkyDH/c7ExfNxpAY9E6PtFU3VpC4JRZ3xkPuspWVXAXrNA2HwNShTBYlb5vewyagggtGtxHY3N2I
	wid3OdkBcC4XUc0r5i0kDn1mwsSpf1XON0b1PQh6UpqRXsypqeoE5wYbJWImMSBvMd6AQtDA7UCbi
	3MD5zpDXHGK1iEXt0Jgsqp9jAd8s5/F5kCemhPnijFqir5vk4Y1HnBz+1gLmR3+DJzno99sbuiQOJ
	s6ArFwndUrGWlOPgI27CSc4IeH2bHc/SjDL7HdUV95HUY6o1wcR0Ce2oQ+UpEE4rcWci4qlpeKaNp
	eTw/IFag==;
Received: from ip6-localhost ([::1]:21828 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tzy2B-001aZE-Tq; Wed, 02 Apr 2025 13:21:35 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153]:39687) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tzy27-001aZ6-1p
 for samba-technical@lists.samba.org; Wed, 02 Apr 2025 13:21:33 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 092981140120;
 Wed,  2 Apr 2025 09:02:52 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-07.internal (MEProxy); Wed, 02 Apr 2025 09:02:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1743598972;
 x=1743685372; bh=fpqFrssur8XwzaX61qKCU1rsBl9PXbyHjQbc2KbZiY0=; b=
 gg6RUPXXt3H3z8L8cmXCPtMBoyEnxaJFzuHjASmOTUQ+M9GlyUQru0hXh41oFKP2
 dFxqjRfR4GsCU3hTndh3uV8MV9gj+uavPPv+EjXQNt6xHA8090cbxGLODU2L2v05
 +3+GnpqEsBzm67jNpHUD1G1kcMyKMLobRwcG0p9B6u6OpxF648pAnXvDEpk2zeKZ
 nEcJExcz/6PClokw8X49JtMMioNymK3ICVBD4WliTeWQ4qpPr06v45lSQUh0yUH9
 oYs9GWq49tB9dnfLdRvQcE4dk0eiNtzdNOlr3RcZg4QeRP71t39ww8R8ZW2jdYsE
 kHxOOLocuzu2Clp4ZpFsCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743598972; x=
 1743685372; bh=fpqFrssur8XwzaX61qKCU1rsBl9PXbyHjQbc2KbZiY0=; b=n
 78nMbbPtE46JMldQeHEXrxRqA+SmvqqlDOlSWSZuaEKGZSoIfmz3WDIV74UvXqjg
 7o6qANRtJ4E/mGd535EW5krWHEj+S/nHHb0h2cRAqcp47UcbjkLFC19lx3sT5Q/o
 ziSt59wqjxlvhB7ggLxScg5bTjDHubrtKSTOIcEhLzvsverk2BKjFVdZm/3ejboU
 5F9elXkDNLiTTpe87NYPKK6mV2rt5SECFE27nHGyDb7eEe3SN4Jsgb5wwc4nLyky
 VwfnGpgJSKVwhXnH/ttlPrG78uN5fDJ0RCOMOJ7ipntXP/ZGiTyz5vBw/Wod87wr
 bVrFrt/VHgJ2M6Rp3iYIA==
X-ME-Sender: <xms:ezXtZ6sDCpW9FyCUSQTXNandTpb9tgG3W3mja7hq1S554mwWeC8lyQ>
 <xme:ezXtZ_dNKWh-_EfibN9NxlOcJTeaKAcr6vrNE54sTxChc3LmCMu4E5LOvvvNH6-bs
 OF0I8YvrkeKxKxDcAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehjeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
 tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
 gsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeej
 feekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
 rghrnhgusgdruggvpdhnsggprhgtphhtthhopeduiedpmhhouggvpehsmhhtphhouhhtpd
 hrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgu
 vghrshdrrhhogigvlhhlsehlihhnrghrohdrohhrghdprhgtphhtthhopegurghnrdgtrg
 hrphgvnhhtvghrsehlihhnrghrohdrohhrghdprhgtphhtthhopehnrghrvghshhdrkhgr
 mhgsohhjuheslhhinhgrrhhordhorhhgpdhrtghpthhtohepthhorhhvrghlughssehlih
 hnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhi
 nhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqd
 hkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehl
 khhfthdqthhrihgrghgvsehlihhsthhsrdhlihhnrghrohdrohhrghdprhgtphhtthhope
 hllhhvmheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:ezXtZ1x0tn7ltpGTDYGifQyNGRwv05HQhp7VrRtfOYJERIsYFU5jDA>
 <xmx:ezXtZ1Of7TE_gxWrJ9c7KR2LYhhzet4wNAtbTSz6jf4tXfLOFRPmbw>
 <xmx:ezXtZ68sGdYz2vnEQ6TnUK9X4QGhn2liLK4occMVE2styVeDxOwdsA>
 <xmx:ezXtZ9XcFzt4U54KRH7UKrG6STA-h_Ug_wweIkJej96LpAu49GYE5A>
 <xmx:ezXtZzN6BS9dQtVWxt3yAmWJ7-RuOF4CsSi15WszlIkVW3qMZzB9w9x6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 4E1562220072; Wed,  2 Apr 2025 09:02:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T1e4eead9af4a5be9
Date: Wed, 02 Apr 2025 15:02:29 +0200
To: "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 clang-built-linux <llvm@lists.linux.dev>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 linux-s390@vger.kernel.org, "open list" <linux-kernel@vger.kernel.org>,
 lkft-triage@lists.linaro.org, samba-technical@lists.samba.org,
 linux-cifs@vger.kernel.org, "Nathan Chancellor" <nathan@kernel.org>
Message-Id: <3ad96ab5-72a3-48ee-8ab3-e68d066169a4@app.fastmail.com>
In-Reply-To: <CA+G9fYuQHeGicnEx1d=XBC0p1LCsndi5q0p86V7pCZ02d8Fv_w@mail.gmail.com>
References: <CA+G9fYuQHeGicnEx1d=XBC0p1LCsndi5q0p86V7pCZ02d8Fv_w@mail.gmail.com>
Subject: Re: clang-nightly: ERROR: modpost: "wcslen" [fs/smb/client/cifs.ko]
 undefined!
Content-Type: text/plain
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
From: Arnd Bergmann via samba-technical <samba-technical@lists.samba.org>
Reply-To: Arnd Bergmann <arnd@arndb.de>
Cc: Shyam Prasad N <sprasad@microsoft.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steve French <sfrench@samba.org>, bharathsm@microsoft.com,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Apr 2, 2025, at 14:21, Naresh Kamboju wrote:
> Build regression: arm powerpc s390 modpost "wcslen" fs smb client
> cifs.ko undefined
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build log
>
> ERROR: modpost: "wcslen" [fs/smb/client/cifs.ko] undefined!

This is from the latest clang release, and Nathan already sent a fix:

https://lore.kernel.org/lkml/20250328-string-add-wcslen-for-llvm-opt-v3-1-a180b4c0c1c4@kernel.org/

     Arnd

