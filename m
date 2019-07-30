Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8D97B370
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jul 2019 21:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=gvX1owGShaVIcWXnhP1/dtG83Y0Krl50sEwJFw+kjbQ=; b=OKk3QUmXMp5Ttg5fYVCYkeY6CG
	ARpgwdL6SlKmcpIJfDu6LScpubSJHXfvo/0SK1oVbBKt9X3NHauXhh5EUlQpgmnbqoPEn7FzS3GUb
	h+DWzWbjwfdy+C4wDBtzgbn/SSzMJ9UU+VEToK709O9PVmTo4Ed/X+Aej57gclmO2VXBh5OSawKm/
	IX5nVz548p4/v0W5RHS+ac0VkiUCbYRZ+vqjCipUA4uOWwhOemJeq4ALu5cQhhniGN70XObalZ069
	dBc18QocnZXI899sPODaGoyDAX+7XZgih/CxV6JbEGIYvxIDmK7gQ7OMbj54IPv3HyFeSUnsaFHXv
	/TLoDX/A==;
Received: from localhost ([::1]:50284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsXvb-00153F-0X; Tue, 30 Jul 2019 19:36:55 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:39408) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsXvV-001538-Vz
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 19:36:52 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id z128so1429460yba.6
 for <samba-technical@lists.samba.org>; Tue, 30 Jul 2019 12:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=9CXENyysL/6hkjBzQp0cR6AhlCmMOV7NJcR5QXo9BqI=;
 b=kA+aKStGBrs5F2/U7gx+JB8Fs8+vqHzvzfA2WpFInv4k4UQbTdN7UVEjbCE8iAEY2W
 DeW96529vrABo/HUASxT+ghQ3uHYuefT9YE/iVP9ZIK4miIs632deqgOPgksyAIi9Pux
 8cq8ApAv3HZIbV8siN6t/smrZi67o2X22/EY4rUn1otjb2dKX9mHt8c0gFR5wgJx/JGG
 zRVefUkjc92d0dRvZ7YR267aZW1/ybk8qytUABY6UiWrE4Yk5ISs+lq8I9GbR8OyoLTV
 kyQvf8eSnSW9rF+4y/cx0d/QDzvHH1mwGuGCrsc/44Gz69qJ37O79GgoNoRpS4SZV7iC
 MZgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=9CXENyysL/6hkjBzQp0cR6AhlCmMOV7NJcR5QXo9BqI=;
 b=gyM+1qejQyQH3+IafuhqT8RGwc0j8b+JpFdpTY1DStcI0LNCZJN/Z5ANLgCMX9njZ6
 ec5uJhz5UkPkBzqpUcRXfojNBqqSk+1MDQTuenMoxnOAM12ENo5zLRkBepb2gnJ64YeL
 eO8eCRb3nPe/9w869/dFyoQrNwXEuEy+fz84J8+A3hHC+oMv51FFFape3tW8SwLZaVlT
 3TTAgSmvPqlDRg/UkwW7Dxt1+BCM4xHh837IRX2lKZP0Cr+ZeKiCjyrSsb+rHTxjFhyZ
 waw4boLpY79Didesf0DMzuwtL976QxYa5zuNFowEV5TRtqk2nNEd0T/OqBfUM6nl6lfw
 UXlw==
X-Gm-Message-State: APjAAAU2hhhgnqUKDIAT3Tm/7kIB6/F0kK0yQRxcdzHdu3bXD6FrNOPs
 iDjSiV0oAk7DajOhNSNkdribBnWokdkZ04KReTg01l/J81w=
X-Google-Smtp-Source: APXvYqxrZ3rITW+1KCD7mBtJncI1Y/uNpLLXBuhG7I4QONVEDADA3gX/nO1u4zYW2DnMt6YmH/MhvNOjWEyGdEiqGCs=
X-Received: by 2002:a25:bc87:: with SMTP id e7mr67959348ybk.361.1564515405373; 
 Tue, 30 Jul 2019 12:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
 <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
 <8219d257b2fe68717939d2f41566ae669fab8466.camel@samba.org>
 <CAN05THQZVBic5xhXNVixp90UfeWz1rt=mF6F0ZXN6aHFCkZmKA@mail.gmail.com>
 <20190730163237.GC128128@jra4> <ad9a941e-539a-b864-542f-01a804bbc88b@sapo.pt>
 <20190730172147.GF128128@jra4>
In-Reply-To: <20190730172147.GF128128@jra4>
Date: Tue, 30 Jul 2019 15:36:34 -0400
Message-ID: <CAB5c7xoe+RVeO5rQuL-To0ikpzjkb3HCkTuUiidUjWGBNc_SNg@mail.gmail.com>
Subject: Re: Turning off SMB1 make slashdot and theregister !
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

To clarify, is this something that would be done in 4.12 or farther off in
the future (like 5.0)?
