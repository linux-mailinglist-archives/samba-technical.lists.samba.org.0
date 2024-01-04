Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CD110824BAF
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jan 2024 00:10:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Q1dEX5Xf2/v0xpFvSo5AcJIu5ZeDSuP2Uu0JMbDOV4w=; b=l0Y4vlfcJQEB+XKwCfhaqx43FN
	y6O0lpdBRlF7Q/zg+TksKuhHEEtHAiT5T5mrViILDQR4HhnB5s++5d4DLQJGSC0+wsU/O7fSJjiES
	3srLMrFhcI+l1av9hF76vCv2CxyGHzcLL12gq+FIQO8wp/SB1Krfi+BLXW0M58yKrudOAh0SGxy/i
	HuutS3+JsWxzy0UO7w0Y782MxJoQ/srvU/kVEi+EMrTAMSwgUiapo2E2M/2HgUgoRXk9SjPypNoId
	kleLOVyQMbDImukMCtKmUMaBqkRv7PTSABnWbpK8Zr8uURieYVxtfp8QysE+lXHZJdl6sdRr1U0FL
	xSgDi7gg==;
Received: from ip6-localhost ([::1]:38518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLWqi-002PJV-7l; Thu, 04 Jan 2024 23:10:02 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:47932) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLWqc-002PJL-1l
 for samba-technical@lists.samba.org; Thu, 04 Jan 2024 23:10:00 +0000
Message-ID: <095d8821cbafdf3f13872f7e9d7125a0@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1704409793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q1dEX5Xf2/v0xpFvSo5AcJIu5ZeDSuP2Uu0JMbDOV4w=;
 b=Z/VCUQZLqs6anqK3V+4MFuVnM3WE9PT3TeR1f5RKNTYJ+gabUOwfWr0mL9hAiTvfxo7wQK
 9Y8Otji95NoqmkAe4fH5DgeBH9VvDforpiZgtGwBzSQ++0jGpD6Vb6RDMZdEfE6gkXzJe1
 kb5lpbfYUs6/LvJZABYaZp5a9689F3PKy6n2qbBcs06svjzP5sLcuUBJOgUBI4RnBmlN48
 1NQ0dJV3Tmkb1edJXK71RBmbZ0lIlL1HiIh+H9j8yjSc2nsD//7xj4Eh4HhArK+IDy+Ugh
 MrPfUYra7DZ5N+iJUcmwE3/B8hC8Ecw1lGGIH1GaPLPVtiY/Y4V0Ruad7xgadw==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1704409793; a=rsa-sha256; cv=none;
 b=luf/u9oifg2PIYLJeuERZv4zZ4A2+vE2jUwdfQRdyQAJ9W62S32sPKj/FvA3enJGeUZYDd
 zk0uw0+z/WVDZ9BIQPb8WES1YKkEgJSSiaTXWeFii8h+dxOmLOXt/XtTHEZeYlvrd3GORo
 XXEcFPHKJE6j9n8zIzDXoiPROW+YFN++pxorUfLkmd0x0q0MxNYAxiXIUOrJV+LNGzCJep
 hLjv/YML7o1xAGekQeLWyMHGa/3103+eqyHWYciXaI/ZXGptcXzDA5spaLAV4HJtyAxsGa
 GsCDenAnhmY+O1JK7zHDl5PMKeq6YkYN6Xt2wnwJKKQgyrPvDVG4WBn9dPOE6g==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1704409793;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1dEX5Xf2/v0xpFvSo5AcJIu5ZeDSuP2Uu0JMbDOV4w=;
 b=U3UJN9GL+S4II9ALXiOVwiDn8zN6Ng9GyUgUVUAyM9oNMy0BAWsyQH8UFvmU8jGSuHICDc
 T09Dlfj2JtFzkc7nFNL7lBRbrUzfN6hplaGejDTWb2rDZRhtwrSGx+PJ+wymEoPV8QSyrc
 JCRedPh+5SraNhh2cBTc3P9pTeG5Exr16grec4veBZgznCSs2J+ymJt6VQsJ4GIHpVrcVn
 sVY993kJm0Z2KeBW4Mk/EqkOCV4TpXsR9MGp2WPGBt12oJouEe1ONbicSlkvrKe/FKfipP
 echPliAqPmFvhvx5wnM+vRKBA2UGNPqFObXWm8UoMaFqS6WnXkJNs3htjXS6HQ==
To: Tom Talpey <tom@talpey.com>, Meetakshi Setiya
 <meetakshisetiyaoss@gmail.com>
Subject: Re: [PATCH 2/2] smb: client: retry compound request without reusing
 lease
In-Reply-To: <62eb08fb-b27f-4c95-ab29-ac838f24d70f@talpey.com>
References: <20231229143521.44880-1-meetakshisetiyaoss@gmail.com>
 <20231229143521.44880-2-meetakshisetiyaoss@gmail.com>
 <7e61ce96ef41bdaf26ac765eda224381@manguebit.com>
 <CAFTVevWC-6S-fbDupfUugEOh_gP-1xrNuZpD15Of9zW5G9BuDQ@mail.gmail.com>
 <c618ab330758fcba46f4a0a6e4158414@manguebit.com>
 <62eb08fb-b27f-4c95-ab29-ac838f24d70f@talpey.com>
Date: Thu, 04 Jan 2024 20:09:50 -0300
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
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 samba-technical@lists.samba.org, sfrench@samba.org,
 Meetakshi Setiya <msetiya@microsoft.com>, bharathsm.hsk@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Tom Talpey <tom@talpey.com> writes:

> On 1/3/2024 9:37 AM, Paulo Alcantara wrote:
>> A possible way to handle such case would be keeping a list of
>> pathname:lease_key pairs inside the inode, so in smb2_compound_op() you
>> could look up the lease key by using @dentry.  I'm not sure if there's a
>> better way to handle it as I haven't looked into it further.
>
> A list would also allow for better handling of lease revocation.

It's also worth mentioning that we could also map the dentry directly to
lease key, so no need to store pathnames inside the inode.

> It seems to me this approach basically discards the original lease,
> putting the client's cached data at risk, no? And what happens if
> EINVAL comes back again, or the connection breaks? Is this a
> recoverable situation?

These are really good points and would need to be investigated before
coming up with an implementation.

