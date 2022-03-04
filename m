Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 285FA4CD750
	for <lists+samba-technical@lfdr.de>; Fri,  4 Mar 2022 16:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=X6BXNIX4tjZlXzj9Kk2YGon2XMEsMwC4WZDv70ZVYYo=; b=jx1Pf26zcBBIPe/mdaLsWbK7YQ
	yge5pf39wXDcl/kc9zoifrBGNvn22teyisUgKN/QxluJ9Xse3gc/Hxnz4YqbfZs4ClnNBDZ/+VKuu
	IdTKLmNGTwYFA2jsZM8A/cQ1Sx8A2ewr4PZpR5giImQX6TKzuroKt3ziIakpFNkB0tomxm/wl8ZhM
	9mwQal9mNOP1wCllCALJzMcb5eqIe7PwMiEaTVoZSAe1MMXfZKZBWNgVmJmzyGY7ELAoUoY2tmc/6
	IH7GOAptBG70w1eJeRS3qbYKEenGNDzCTRCoeRDnKBg0c+KXjNXqeFOOvF232fya1Bn3eTfT9G6cE
	NVgspzLg==;
Received: from ip6-localhost ([::1]:26336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nQ9Y2-00Fmz1-PE; Fri, 04 Mar 2022 15:08:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49404) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nQ9Xy-00Fmys-Eb
 for samba-technical@lists.samba.org; Fri, 04 Mar 2022 15:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=X6BXNIX4tjZlXzj9Kk2YGon2XMEsMwC4WZDv70ZVYYo=; b=cXKa5sadBRf6U1xAmtTdddJhjm
 bZlsX5aX2UedBvc0v92OmNJWBAfaEckwvjBgoOs5Wv0f8KB8MHLHnbCwN0UiPUHSdsIB+SZuaQFBF
 OuNdbB8cKiFxIc0LNOo6qKcIK3nXRcFde3ulnP11MNd98wDf4CV4tTnd2xiCMNctlR6fhlsBOnRMm
 eLXcBjvgiT81rd55nmJDIqEPq+qrgQFKOur9HEyixrptD5uXpZROmGydLaRNypfRWtqH1CYpZ7mVu
 yLaV0ffrNEe4wGAxhCSuqZmynI3e6S1vrHNrT2QCKymGgVxXSHB5NhsKXFaagF4YiJezNr3qqy6Uh
 41oyHphLN1lLJfNKnOqtkBWrGfw0m2a55QJpgOOXhrwaTl5rdXJlsmP4ZA8Z7+CiwoFTXuHOY9+M2
 lpk8dTm8dYJWqf1n03ZLkoHAgnz7dcITEPVvvSrnfIF5MzkoMS6pDEOKUqY3i3RiFRs6+mvxyL3pp
 uKG7lILzL0W5b9FG3KTemyyg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nQ9Xx-006hKs-BA; Fri, 04 Mar 2022 15:08:45 +0000
Message-ID: <1b5f084c-936b-888d-aea8-88aaa2a8175d@samba.org>
Date: Fri, 4 Mar 2022 16:08:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Two samba domains in one forest
Content-Language: en-US
To: =?UTF-8?Q?Pavel_B=c5=99ezina?= <pbrezina@redhat.com>,
 samba-technical@lists.samba.org
References: <81206267-0468-54eb-8724-4710d22cae89@redhat.com>
In-Reply-To: <81206267-0468-54eb-8724-4710d22cae89@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Pavel,

> is it possible to create a domain trust between two domains to achieve a subdomain relationship in a forest? For example child.samba.test <--> samba.test.

This is currently not possible, it would require quite work to add.

metze


