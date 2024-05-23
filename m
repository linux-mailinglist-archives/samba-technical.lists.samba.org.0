Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC05C8CD70D
	for <lists+samba-technical@lfdr.de>; Thu, 23 May 2024 17:29:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/r9WDuhyTrYiRJw0w6NNYoWzVyOcM/0aQtOPTYXoD7Y=; b=1MWqAdVNuVi+DRkPD3+N8gIfcj
	ZrdnCQvhhevvxegpJM+MkPBusEcvBgIhHYlAZgoC/IIKN7+Mw+sF6m51koxDhImXl0HXQI42aOrlQ
	6ez/1h+blqaB8KvO6AxB+z0d7lY1qqprpaI/AtmGNyHcCYwDS3N/Qv0pfQZ+HEhAomLqOYdjDTRQY
	+GI78S8VAIQja24ITT7XYqVRd3ShM89KPjYAVrK68sk3IHKL484ljd+Cq3G4joKv409f2IRTGPz/l
	/mmmw6VVx2sIUIgLSrXl8qXNvsn9HXxYYkDJmSqXF0rTt/rJwi9fJ8we06GwRykNRPnK+jicbsoxF
	g6KZLAaA==;
Received: from ip6-localhost ([::1]:25800 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sAAN4-009kgN-35; Thu, 23 May 2024 15:28:46 +0000
Received: from mx.manguebit.com ([167.235.159.17]:36162) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sAAN0-009kgG-6v
 for samba-technical@lists.samba.org; Thu, 23 May 2024 15:28:44 +0000
Message-ID: <af49124840aa5960107772673f807f88@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1716478118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/r9WDuhyTrYiRJw0w6NNYoWzVyOcM/0aQtOPTYXoD7Y=;
 b=C9PeZmkQ9vvunhij5km1Uzb1b1eWUAV9c/hD9hu8J1Oawd5yw1uBO/8Tv8hO0uYDaYnfvL
 aQgvi+kT3EAk5Nyyf8stnssCFrRx3Cppamye73RTuU92ITUjogI0KXcgHIU7Hu0Cs7iPS/
 2uBuvuz/vz6/2IJK3s69X/sLCZRJQpYpeBwZLr4mdyIn42DRhaEtQVu6jNliT8pYcFqCYk
 hjumdW5d4GokOrL4AQrmlSRDjPBl1KN5PHo1PkDxwofC1ZBfc1gvmxJ0pcJ6AptbLcAle4
 FWOsJt73tcFVGVTugv5ZfnjmGRVGUlaHfGV/jLROKkSuw2hAJwmbYyR9AQkvcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1716478118;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/r9WDuhyTrYiRJw0w6NNYoWzVyOcM/0aQtOPTYXoD7Y=;
 b=fN5w9V3DGsfzgbh2fu2yk9qTJq5U6N8LM7uFd2JUKVJs1mvVVLskWyW2dZ7wDzHlGV+Yqf
 /rjKE+W1G5IPYWHgSzgLbwOx9Zuhm0WUBlbgoO78UtLDB0E+OIjpupgaQ4a9J688GN/lRn
 uX7zcZk4ldcgbxhHqugwPz2eLQ+Nw7dTvfXgBI4EoF9Dn59NV5kWEr5Mlyqdt9zpINooCU
 yNxe4VO3r3ksArHMnBKPkJ4M+8WHICoypHA3T7HZnC4XSyVl4lLqwpTufFWWlM8SVtkYwa
 5CtO0MdP7jp4talzRdgqZMVbn9gcplNyfFI2P5BVhW4Bz+J2lHi2sTZjxDNyww==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1716478118; a=rsa-sha256; cv=none;
 b=GW2bf/utuNZP2KnPCVg9yQfjSxYf5JCIdSSvNCRg1zCockNL5LERnxMOAkado7ZnA8WN8L
 WHcb9fT3IkUHWjF2fvSopOaBsPY396F0DTuMq2i69E8u0f2W3JQW0vDRd/HWBFgObFeQO0
 JkAiqhbk4E1UcYKLFCqlG+x47Xzuv803DdUUlyj4GzL/GFgn0WRn5pZ1yf7CjoAyHN4Hgm
 ukTU3Iz/Ec59iCtCmEl8uX5YGWq97zyFeb51ocBSwsirGLjZ6b+qH55IKByJ8Ps0s4hS7t
 gimMTHitn1/k0q/L9u3578gy9LgIie5J/AvwzMbpHhffqcVoRh5d7ZEGFPcSSw==
To: Tom Talpey <tom@talpey.com>, David Howells <dhowells@redhat.com>, ronnie
 sahlberg <ronniesahlberg@gmail.com>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
In-Reply-To: <6ea739f6-640a-4f13-a9a9-d41538be9111@talpey.com>
References: <CAN05THTB+7B0W8fbe_KPkF0C1eKfi_sPWYyuBVDrjQVbufN8Jg@mail.gmail.com>
 <20240522185305.69e04dab@echidna>
 <349671.1716335639@warthog.procyon.org.uk>
 <370800.1716374185@warthog.procyon.org.uk>
 <20240523145420.5bf49110@echidna>
 <CAN05THRuP4_7FvOOrTxHcZXC4dWjjqStRLqS7G_iCAwU5MUNwQ@mail.gmail.com>
 <476489.1716445261@warthog.procyon.org.uk>
 <477167.1716446208@warthog.procyon.org.uk>
 <6ea739f6-640a-4f13-a9a9-d41538be9111@talpey.com>
Date: Thu, 23 May 2024 12:28:35 -0300
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@manguebit.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 David Howells via samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>, David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Tom Talpey <tom@talpey.com> writes:

> Yeah, I think this is a Samba server issue. Ronnie is right that it
> should return a partial response and a STATUS_BUFFER_OVERFLOW error
> indicating that it's partial. It's not supposed to return
> STATUS_BUFFER_TOO_SMALL unless the entire buffer is less than one
> entry.
>
> MS-FSA section 2.5.10.22
>
> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-fsa/385dec98-90fe-477f-9789-20a47a7b8467

Yes.  I've just tested it against Windows Server 2022 and it correctly
returns STATUS_BUFFER_OVERFLOW.

