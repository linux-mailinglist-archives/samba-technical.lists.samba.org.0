Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0BA38B92F
	for <lists+samba-technical@lfdr.de>; Thu, 20 May 2021 23:49:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=uSOlDaxgsjbHAB7eOPnGuvR7mjmB6K+prIbyTJ2q1dc=; b=yfAfGKW5MREerHZpJIS46uAKxO
	Q/S5CJbuq6nhsHhU+QOFT6U++PG0YJM3Ujfn9A2fdub2rt+/EA3EhQnMiMYJ54X23fytS2NCnsLvC
	N8GYaGHAuL9pWnT5oYKgaeNoWmt2js4E7zSbmJNF6XEGcJfZu4rWeDpeRFihpR9tI5Z5kNLeJmuLl
	sI9lKnCoe3wIEwg/vTrTj2OTZDIZ5RBrSL9QDoDjOKBTi5qAZCNevGeh3yYeJPALS0aDAb2N8lw+0
	pz20cS00hRklfkNbLl39j8Y+7tX0AXoFVM7rdvh9tY41rvTF2NB7U58ciwI8bzCrRPferTu4h0yfN
	IYaa7YcQ==;
Received: from ip6-localhost ([::1]:59118 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ljqXm-002PDd-Rs; Thu, 20 May 2021 21:49:26 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:56588) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ljqXf-002PDT-8z
 for samba-technical@lists.samba.org; Thu, 20 May 2021 21:49:24 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 948FA8118E; 
 Fri, 21 May 2021 09:48:53 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1621547334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uSOlDaxgsjbHAB7eOPnGuvR7mjmB6K+prIbyTJ2q1dc=;
 b=Vzlrz+6TUSuE3Ba3tD1bd0nGGjlwMQWpPiZYYJGKODYn7nwDWH+H04cGO9L3N4VYlSnNqj
 EtOvdIZfLC8ExgUW64d4aKpuKfwB8kdmHGepHq9ZeidLgDtjrHb9bUCdVVvNBhdTIS/yTW
 PqQ+1/EYko9Zfr7FeuZZcv8o6ZhqdKMDJevRGX82+cgmf8kaZ2KpUhgQrlLaZ/GMrX/2KC
 OuYWJ7RBSF9UXPiSkF7lFVmlmn0BNaG7EDu4BwoIBiF9A28/gyK4Wq22U1v2zaaw8RJinu
 6CVjaYPf3ecdgVxMkFip+B2yHkWhAXkk2CO4r8eDR+HmNmfXQQQFmqCbTYheCQ==
Subject: Re: GPO created via samba-tool don't Copy or Backup
To: Klaas TJEBBES <klaas.tjebbes@ac-dijon.fr>, samba-technical@lists.samba.org
References: <37f6ef50-99b4-7e37-b22e-a29f219ecf2c@ac-dijon.fr>
 <bc1323c0-53eb-70d5-7e1a-c3d2e14a4df1@ac-dijon.fr>
 <daae17c9-1bda-01c2-e5f2-7f8cee6aabb8@ac-dijon.fr>
 <86f25c50-02c1-1baa-5ce1-907c54e36e25@catalyst.net.nz>
 <303323c1-4683-143a-a619-87996b009539@ac-dijon.fr>
Message-ID: <c51a7372-fa8f-2f8e-eeeb-7b3bb7e27a89@catalyst.net.nz>
Date: Fri, 21 May 2021 09:48:52 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <303323c1-4683-143a-a619-87996b009539@ac-dijon.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 20/05/21 11:33 pm, Klaas TJEBBES wrote:
> Hello.
> 
> As you told me I've posted my question on the "samba" list.
> 
> But I posted it here because it looked to me like a samba bug.

OK, sorry, I didn't read deeply, and thank you for continuing to
investigate this!

Yes, opening a https://bugzilla.samba.org/ bug is the right thing to do.

Douglas

