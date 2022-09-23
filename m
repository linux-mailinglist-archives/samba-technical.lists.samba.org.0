Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CDF5E85CD
	for <lists+samba-technical@lfdr.de>; Sat, 24 Sep 2022 00:23:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=CKx0EWBSnlgWRGuuo7o6r0O7RLiYCQPI7wmhX7AFvUo=; b=OdfwVRElTo+BL+PtAsiiVYv55j
	DJa9SIMZYrGMbPzAqw05ISeabkXRHxLZQuxjd7rms9W8Ogsl2t4oPSJopzpivTfc8sjiFtMQKMhSg
	8OWK2Y3pbEZyDPdT0m0PtHEfuNoac/CEH/Lv/7JTA/EYFNXsPYGlXrqD7hTAafboOzDvhAJW/P5XD
	6EGeyZKsifKvqiwRj/z1BvduuTOlR8XELuhMX4B5mgpscaIRdq4ca0Nrx/uyQrYYEkOkFVsLmS4hI
	AXZ00rZJ28q2AR/xi/j3r7fGxXUFBfwh9+q2ydayeEDLJM9aGcqxBBoREFySYoEvxI1VUI+6e2zn1
	Dlr8W50A==;
Received: from ip6-localhost ([::1]:45924 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1obr4N-003lDu-Ir; Fri, 23 Sep 2022 22:22:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52132) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1obr4I-003lDl-JJ
 for samba-technical@lists.samba.org; Fri, 23 Sep 2022 22:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=CKx0EWBSnlgWRGuuo7o6r0O7RLiYCQPI7wmhX7AFvUo=; b=YP6zTQTZ5JMyAdjjThuSaozexr
 fcyQx+DfWtn0smsEnaS+x5OMWUnoDd3rNCkp5iFPuHcvEJYCiTMwJcpvZ8r+zcqjG7DyVUULOqVP7
 HSAhcga8r14hgS/6Zqs0PiC93x0LQsh5nSgztLNOzzYoTnwA4aQIWuza7nG53KTjYZ7CHFrCCA584
 rOjx/6RSM/vzn+88ek1HJ6Ro9zsCEWwje1GeCT0pPDonucRr0/o9Fxykofd0gp7LsLBNou4zugK7S
 kmMK8JK+VT5t05KOEBGl8da/Fn4m8qtMYUuEcE1RQT3eDXjdPAu4Pekkpte8FnnWQhT7xUhs6WdLZ
 +WwVoU9BoRYk2ROkAo10zFNclhNKe3sSWpB7hrHt3qHceRF5IJXitDeLRjkZOr8vN4uvYbYAfzZ+W
 s01qVB1SPohQtcgCmc8SNrDL8luz6U9vEAIv1qLYRZ5MLcWjrjDIxXw1AYO4LiwAeAftvPgi8yTNN
 4K181Ao6k7FoYEOVNY6LJ6Rb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1obr4H-001fWd-82; Fri, 23 Sep 2022 22:22:45 +0000
Date: Fri, 23 Sep 2022 15:22:42 -0700
To: "Nathaniel W. Turner" <nathanielwyliet@gmail.com>
Subject: Re: IPv6 and commit d882add695bbd5ea03961c08ac2c0380fbf2947b
Message-ID: <Yy4xsp3cNIp083La@jeremy-acer>
References: <CAPw4iV4nxm2F9TeVvaA=M1Ony92eONtu981WzwUADVBdFET0XQ@mail.gmail.com>
 <YyTdlsd2ExgX8U9r@jeremy-acer> <YyToAYaXsfopiTdh@jeremy-acer>
 <CAPw4iV5LFvdoici7f5opBUA5bz86QG2cX9muzQ8GDsMU3RcW3Q@mail.gmail.com>
 <YyqQ9HtsTM2lmkQF@jeremy-acer> <Yys3/WVPd/gjBbEi@jeremy-acer>
 <CAPw4iV4AH7e4odCQ=xjzG-bAcr=5mGVPFA8qf18WBz8wun_SLQ@mail.gmail.com>
 <Yy4uev/AGxGDAJB4@jeremy-acer>
 <CAPw4iV4xM0FEvPhbY-7S-uSdF9StW1ZeSniA1qoxzdNh9MdNDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPw4iV4xM0FEvPhbY-7S-uSdF9StW1ZeSniA1qoxzdNh9MdNDA@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 23, 2022 at 06:11:00PM -0400, Nathaniel W. Turner via samba-technical wrote:
>On Fri, Sep 23, 2022 at 6:09 PM Jeremy Allison <jra@samba.org> wrote:
>
>> I'm getting 404's on those links, sorry.
>>
>
>Sorry, I had inadvertently made my fork private. Fixed now.

This code:

	 * We're only returning up to 2 addresses per
	 * DC name, so just allocate size numdcs x 2.
	 */

	dclist = talloc_zero_array(mem_ctx,
				   struct ip_service_name,
				   numdcs * 2);
	if (!dclist) {
		TALLOC_FREE(dcs);

needs an integer wrap tests for numdcs * 2 before
passing it to an allocation function. Something
like:

	if (numdcs + numdcs < numdcs) {
		TALLOC_FREE(dcs);
		return NT_STATUS_INVALID_PARAMETER;
	}

Jeremy.

