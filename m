Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B44CB53526F
	for <lists+samba-technical@lfdr.de>; Thu, 26 May 2022 19:11:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=zFrn2mghhi18p+QwyXwt5t3uM4S1bXu3KIorOyT1GI8=; b=Og1nHFD5STrzWuJAnI2rfV0g9H
	5W0ESgVR+gWKEvv7N+TX9BOhXDYo7cFE0d6gvHhTFBQ44x3IzuTnMs9Xlt4aF8vQOTgDg5ItSYBxy
	a8j716aFgEFho+r4dcWfX8NTDA97C9A3qXqEU8gRqLlwLtz3h1AEdNy6zO7qA8xU3Jt20TEtnVWcO
	x/I5pOGPuD19YfMg1Rp+wBdVgCAFU8IWCs03zMNNIKyhITd5YguQaPqWYbsHtYkD+ul5ADEpaqE90
	tBiZV4fi/9FBv2yqsZ4sHhlip7GQP7/IRWizepIyE+Rg23UuB2k7zoASSJPmiW3RmaU7SHp13jZFO
	LuqpjTlQ==;
Received: from ip6-localhost ([::1]:37802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nuGzn-003Ahr-EL; Thu, 26 May 2022 17:09:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61832) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nuGzg-003AhJ-0m; Thu, 26 May 2022 17:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=zFrn2mghhi18p+QwyXwt5t3uM4S1bXu3KIorOyT1GI8=; b=XXVUmRKqklaOOEOsVxRvi/fEfn
 LzHI5iL8gTIST//7XgJ+vloUPgulwPeSrpmiwcmzG8RDwMPKs7Bmc/Fx0sLdb1Dl0pqEJAjuiaIPf
 BXh9UquWbjkihTQ1K/7t2lCP5ZCSLfsL5nGiFEMG6YdTRKTK66HwnpJVLv9i2gNRwf2IHwhD9Geg2
 gtIFan+3dD2z/p5NCqNK2pUsfTO1eTMSC/VzqKtCRrhX/ETGTh6uX6XD2CQETQKCaC20QoXPW0Y1x
 ZYMvsBqaE2vDrxCPlx4SEyEWL/YWHiCViPgfGDTkplSQSTFoDMtnlUgPfHYIkIqB3j0PspUgvypXd
 yNhaL5ddjJPTL4dBJEWaZpFUQHrogzOh6LDuqQToIGzf3LuKhhDrUTTw9NRnht4LpsWqECtKGJp5O
 6rZofbfvHyMFm6E/fF7/kIBPzC+g0HxGFyYqPVuRtK185syKxAzRkISyW851Kiuw4yDMELv8YJ3uo
 XcrDhZa2TPFgkS8Hufc7aqPJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nuGze-002cH8-Pz; Thu, 26 May 2022 17:09:51 +0000
Date: Thu, 26 May 2022 10:09:47 -0700
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: (Virtual) SambaXP Conference next week !
Message-ID: <Yo+0W0chbLCiGrVb@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Just a reminder, if you're on these lists we'd *love*
to see you at the virtual SambaXP conference next
week, 31st of May - 2nd of June 2022.

https://sambaxp.org/

It's easy to register, and free too ! If you are
using or developing with Samba, there is lots of
content that you're sure to find interesting and
helpful.

Hope to see you all (virtually) there !

Cheers,

Jeremy Allison,
Samba Team.

