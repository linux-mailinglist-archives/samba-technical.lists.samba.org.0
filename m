Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 255B12FBED9
	for <lists+samba-technical@lfdr.de>; Tue, 19 Jan 2021 19:24:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=KUTbe896af82vG5DWesBDu2jGQIusBlESAOriZ1JoY4=; b=PLBgjGJU28O3stX8D4l0/Ktd8f
	Mrqbbc3UdcXYolg7krkjhrckRaOiJoMrm5OhQvdoRbub/5XyCy4BhotngBEqVGvrP+E4Wp1QPEM6j
	xK1U7B0EmpsomOhBtS+97RKkB0eG135eORUxV7pyZhzxnwJftvBgu4/ObSa/Y5/wAN+v32tCXCJoD
	ftSjvXL9HDGDpZe6W+H3A0HIUdwnIcBAgnY213o8/Lbh9Oe1ek/5fm8I0Q4MfZ3JcvJCMLwm5KD0d
	F7LXXbTCO/2/FMYlajBbbd3W1b4gnEhvZ8mUvzeNeYZ0cyTAAdW6ioW7M4EDap5k7iprvWTaZS/Fx
	ro/i8emg==;
Received: from ip6-localhost ([::1]:60364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l1vfE-006E6l-Lp; Tue, 19 Jan 2021 18:23:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57366) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l1vf5-006E6e-Do
 for samba-technical@lists.samba.org; Tue, 19 Jan 2021 18:23:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=KUTbe896af82vG5DWesBDu2jGQIusBlESAOriZ1JoY4=; b=SPPmi3rBREPu5kS8D1zK+R1AgW
 XCtRI8qOTVb9FH0VAP4iSx/Nx6i/Iqtfkqt1uoyWes0n53drJgIWeGdqHFIFo/urYuUZuhmyfU95n
 VW3Zmt2ka3mKSsnIz70hf9ut6J85EgTdYBzCLmJDPG9kCnrJ3YNRHcWh25Ac17jt1JKgmFuIIpLFY
 GBtDCRAvt07wcW6M6y3CqNVlW57G+XIXW1rKIHRFDoWS5OeJykwiyNGns2kxe7Zuxx4mYxCVrUhGS
 r4BzhfvYsL6oinedKjb0zrMEuirgkmGFIuC8ELzvQB4aXQ4Lk+M1xbigTkkvabRqbZtra/4b9zBPF
 zZLoht7asLkXZJO2IRWvdKhNucBiyMD6N2JrpxzyWfCNU7aGCU6CoTmNWsd9+ipfOpz1MwodpA1Va
 fzTQyv5yLLLIF5XXPHRVQf7oMX9OvIC+D8virm8yqgLbxvmsphMQC/yNK4OUohvqMchU5iB2wnBa1
 vSufpEj3njwB2sOC7Pcz02Eq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l1veo-0007OH-Mr; Tue, 19 Jan 2021 18:23:11 +0000
Date: Tue, 19 Jan 2021 10:23:08 -0800
To: Stefan Kania <stefan@kania-online.de>
Subject: Re: printer driver type 4
Message-ID: <20210119182308.GF223756@jeremy-acer>
References: <7781e141-42b9-17c6-278e-9094edf39ee0@kania-online.de>
 <16983374.jckQO7Hm9i@magrathea>
 <5ecefecd-d41d-9c06-4be8-a0eb18ad7e3b@kania-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <5ecefecd-d41d-9c06-4be8-a0eb18ad7e3b@kania-online.de>
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
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jan 19, 2021 at 10:02:23AM +0100, Stefan Kania via samba-technical wrote:
>Can I help somehow? It' might not be impotent for the developers, but I
>can tell you many admins are waiting for type 4 printer driver. Many of
>my customers are using samba as print server but it getting more and
>more difficult to get new printers with type 3 drivers

I'm happy to review any patches needed to get this into
upstream. Don't have bandwidth to write them though, sorry.

