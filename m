Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B2752B315
	for <lists+samba-technical@lfdr.de>; Wed, 18 May 2022 09:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Vg2LOdyNIJEUFLqpC4QkMRX0hLBenNyU2FcA/7YPHfU=; b=RWi7acEA7iJvzP7MCCR78pZS2h
	eUkvtnLspShg9F21qa5WCu34kLFskUAaFoogmD64ucxZX4pya6hwudNo7F7SCYLVn0prSrvC4jitH
	KFk/x7BNeRTp3CiwKLbKhy6igczPLphW+9b3RAeQIAX9pC3tM6L/k6oypy4yMG8SA6uZIxyEVuhNm
	Cc7lujF3UFr/mzEV/GrAcegYaRX0AP74r7xsxt9mhmLMNu2KoBxPvoOht7Ose80qTD3SYRnVvvFOK
	TNlAMKNzmcg+7WXecQX6YeyUbPj3pwFTDmCItMXqODijqcxzRpOu6ftzarab9TQekwi0D4fw/gnGa
	2IG8KDAw==;
Received: from ip6-localhost ([::1]:35386 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nrDqT-001uya-Ex; Wed, 18 May 2022 07:11:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61648) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nrDq8-001uyQ-1R
 for samba-technical@lists.samba.org; Wed, 18 May 2022 07:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Vg2LOdyNIJEUFLqpC4QkMRX0hLBenNyU2FcA/7YPHfU=; b=nlry2JgoivHMg/68x/ZRM1f3/F
 B075ikSanR/9Cb59xQz7adyzJTZ7DURSsPwSnn2+4GJemn7+YjMaMODNi/vBxr0Zpsri3pvKsLIAL
 rLqdLE+sapdn3iWlU06eSoVsxeeS/qmCuPE6Vc1YGJ0SAjBBMvo4+pwuURfXqbvCXbn9GZPszLuar
 j1JNZkMxTWRYk7DE6/s8j7A5BgzF0aOgcriRPctILu4TNO37Pbn6PbNhCIJKe53fwTZDJjhkfWGfc
 UDkalFzoi5jRkSwY3xcX0Cgr1mK5x8vhEdGjKAaL5R04S2G2PNtwIoi/SDm2/JBxnSUP6szIjW0gB
 doDEp4m33tPMF37CDnzEcCrvGRee552TJQzBl2a3w7awB7o0zwP55hiYAk86tyGdsaWBQTpJef3XE
 OGYn4JXXcP3K0i8npWTcZQpj3eQ3dw9DSid7blY4enM6DDJD/fDwv1lcoqdTCsWuBRSJnXizBBDDo
 f25+gmDyuob21TrkOYVtFmn9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nrDq3-001SjG-9b
 for samba-technical@lists.samba.org; Wed, 18 May 2022 07:11:19 +0000
Message-ID: <68118e13ab297de53be260deeeb3094563ce7f3d.camel@samba.org>
Subject: Re: ** server can't find 36.40.168.192.in-addr.arpa: NXDOMAIN
To: samba-technical@lists.samba.org
Date: Wed, 18 May 2022 08:11:18 +0100
In-Reply-To: <CAM61p32DPdUCwLLSXx7Pez_HD8xc7nLQYkVhZFrhNDJ5wT7yBA@mail.gmail.com>
References: <CAM61p32DPdUCwLLSXx7Pez_HD8xc7nLQYkVhZFrhNDJ5wT7yBA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2022-05-17 at 11:55 +0530, Prince Chaudhary via samba-technical 
wrote:
> Hello Samba Team,
> i am getting this error *{** server can't find 36.40.168.192.in-
> addr.arpa:
> NXDOMAIN} *while i do nslookup to my server ip, this came after i
> added
> reverse lookup zone and tried to get server name using ip address
> although all other tests are successful, could you please guide me if
> i am
> missing something?

You are asking in the wrong place, trying asking on the 'samba mailing
list'

Rowland



