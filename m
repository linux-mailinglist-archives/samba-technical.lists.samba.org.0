Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F2986D2EB
	for <lists+samba-technical@lfdr.de>; Thu, 29 Feb 2024 20:13:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jej1sBhkxdN1NAiBzWebNP2TZcnnFsyGp0VQDOU7J9U=; b=ACkgHF6xpnITAhivoqGYhO14l5
	hFtI9hvueEPeb/HpjtoSf2M9UYl5qnFdNKQSs3lt2yFgdrSq1AKDL/vrEQFzQ6ht+Ih1lhcyT35hw
	luSDzyVxzoCOzmyjQkWjFgFW2U5qGyygG4DDMm2f0MVbXS9XUDwfIot+XWzv4Nzxn1BhITC+yzTNH
	VH0hUxge/j4w+yf28l1llvoG+fAljCeu8wb4Ue1F4AnW+mvYMFncrs4e3VTHIC4Bg3KbhpN3LMEIX
	H773ld5zbAwmc+8QdVyNBIpQCBISRhz356/xRXjEgAQCtwW5Ronk+yO6dSgNROip8g8x5rpWY9rVr
	d/svRmXQ==;
Received: from ip6-localhost ([::1]:33478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rflqI-009is6-65; Thu, 29 Feb 2024 19:13:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22348) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rflqD-009irz-8a
 for samba-technical@lists.samba.org; Thu, 29 Feb 2024 19:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709233987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jej1sBhkxdN1NAiBzWebNP2TZcnnFsyGp0VQDOU7J9U=;
 b=fqL0SzxVGcjeeDkLgVKMdHo7iKWEkfNGV3PX3BiIpBSKiBl8aGYBPv2yfBXuWfkU6qoJo7
 taxCpfMmrcYVL+Ik0+8rSkPzuQPY39qJCTutAelsAP06vQt6F5RJ/PXM/dV7o60rWDQv7C
 7CQf9sB1rwBpjLElGlGisoMMQ5t7tlM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709233987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jej1sBhkxdN1NAiBzWebNP2TZcnnFsyGp0VQDOU7J9U=;
 b=fqL0SzxVGcjeeDkLgVKMdHo7iKWEkfNGV3PX3BiIpBSKiBl8aGYBPv2yfBXuWfkU6qoJo7
 taxCpfMmrcYVL+Ik0+8rSkPzuQPY39qJCTutAelsAP06vQt6F5RJ/PXM/dV7o60rWDQv7C
 7CQf9sB1rwBpjLElGlGisoMMQ5t7tlM=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-H24nl7zKNfq1cLwOhSG2bA-1; Thu, 29 Feb 2024 14:13:05 -0500
X-MC-Unique: H24nl7zKNfq1cLwOhSG2bA-1
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-dc3645a6790so2350335276.0
 for <samba-technical@lists.samba.org>; Thu, 29 Feb 2024 11:13:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709233985; x=1709838785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jej1sBhkxdN1NAiBzWebNP2TZcnnFsyGp0VQDOU7J9U=;
 b=wiYQuihfdMlrjfP4BTEmGxNIFy1ECcdakJPTjOKTBkCQzVoyp7I4K61E6H64iSLEWa
 vozNbKZFDLlX8CWREX5gUrjq8kk4k8jUB/D7oa1UmOd4xgvT8P8hH61ZV/2twlTXASA/
 H/pGJl1f+CDqW0TqP5BImJHKXIxSqCLWtFHj7V6F7JZlXUKj6MGY02YIyiDaMu2ioAms
 q/TjPLADoeW07poa9WlfGZIx4b7VIDneTNvUxUE8CT+4YTlCtUTZF/+uvB5hoNEm9GDg
 oCycRo9q/bqk+9DuuVdAKp5Zi77YysiTUzcBjyMs5t6E5DIMJvvD4ToUGF5Ld61FmsUa
 8KhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO0dWyRrEYdJQvGGsCl/+JxIRUXl0zL5HeYYbM8k3DpJEHkAwHcO2v04NIcF9C2en8b8hSipW/MNGFof0d4cWFNmDx+Fd+7V1X8dxhq1iI
X-Gm-Message-State: AOJu0YzsDCBHuaCcHcvW3kRQRYrjUCJ7HkJl7Mfa6tYmYo4F2JwLUDJh
 ACe+1KeRV0vIaF3MiGjkEEBPAlnCKGXfXOLwaQDvhPfutZYqR4xIoXi2M3y9g3/x40mhngN9sHQ
 d4HfYCCr2/oXFvvedgeMFGNDg4ofZDZvC204y7+3hyruXyDnNjjiD6vqIwTBZVQPACO8zdomYkV
 tDuh/0PIIikIb6wsQ0AysUxuPmo5vd9IiEKD5unOkv
X-Received: by 2002:a05:6902:cc9:b0:dcc:8e02:a6b6 with SMTP id
 cq9-20020a0569020cc900b00dcc8e02a6b6mr3922604ybb.2.1709233984777; 
 Thu, 29 Feb 2024 11:13:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHA59zpRQtAVJA4vyNSPAGfM5CBzPhLKr8lq/O35tnmstVuQuSV9Rxm5tAk81hR4TTTpPuut/kHCSMzA6zHckk=
X-Received: by 2002:a05:6902:cc9:b0:dcc:8e02:a6b6 with SMTP id
 cq9-20020a0569020cc900b00dcc8e02a6b6mr3922530ybb.2.1709233983243; Thu, 29 Feb
 2024 11:13:03 -0800 (PST)
MIME-Version: 1.0
References: <CALe0_77CgEXNiXrM4oQ47sfHnDoML18oz5rmEu-_57Av0KRTkg@mail.gmail.com>
 <20240108181751.natpy6fac7fzdjqd@suse.de>
 <CALe0_777GL=XQYSochOoph73madKm8DsRn+xQOcTmz9xh+wcHQ@mail.gmail.com>
 <20240109005628.5xbwpkqc75okxmcg@suse.de>
In-Reply-To: <20240109005628.5xbwpkqc75okxmcg@suse.de>
Date: Thu, 29 Feb 2024 14:12:26 -0500
Message-ID: <CALe0_77mahrd+ggWApLYRqCLC0k252r=_89qHW7Oa10RK4D4JA@mail.gmail.com>
Subject: Re: Linux client SMB and DFS site awareness
To: Enzo Matsumiya <ematsumiya@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Jacob Shivers via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jacob Shivers <jshivers@redhat.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello Enzo,

Sorry for the delay in response. To further clarify the use-case it is
not pertaining to the target shares, but concerning the namespace
server that we connect to as part of the initial mount for the domain
based DFS share. Assume an environment with some N number of DCs where
each DC is in their own site, a DFS namespace member for the same
namespace, and the domain resolves to each DC in a round-robin.

Condition #1
For AD client site members that are in the same subnet as the site
local DC, we only ever connect to said DC when mounting a domain based
DFS share.

Condition #2
For AD client site members that are *not* in the same subnet as the
site local DC, we connect to a DC that the domain name resolves to,
site local DC, and then the SMB target. We have a  1/N chance of
connecting to the site local DC initially which is not desirable.

For condition #2, we could be potentially connecting to DCs that could
be prohibitively far geographically and incur a non-trivial delay with
possible timeout. While certainly the appeal of a domain based DFS
mount is the abstraction to know which SMB server to access, condition
#2 can yield mount issues when the AD client does not have the
capacity/opportunity to add a DC to the subnet for whatever reason.
This could include heavily siloed environments, separate teams, or
cross vendor interactions.

I could see a use-case where should the SMB client want to limit which
DCs to connect to, with the intent to exclude non-desirable DCs, a
flag be passed that invokes a CLDAP ping to affect such a change. This
can already be done with a hacky wrapper script, but I am curious as
to what level of interest there would be for a more durable
implementation.

Hope that helps to clarify the situation and please ask any follow-up
questions should you or anyone else have any.

Regards,

Jacob Shivers

On Mon, Jan 8, 2024 at 7:56=E2=80=AFPM Enzo Matsumiya <ematsumiya@suse.de> =
wrote:
>
> Hi Jacob,
>
> On 01/08, Jacob Shivers wrote:
> >Hello Enzo,
> >
> >Thank you for the response!
>
> Thanks for elaborating.
>
> >I failed to mention the initial aspect that is specific to mounting a
> >domain based DFS share. This would contact a random domain controller
> >instead of a DC local to the calling client's site, should it exist. A
> >CLAP ping like that used by SSSD[0] could be used to identify the
> >nearest domain controller prior to initiating a subsequent mount
> >request. This is where the DNS discovery for a ldap entry would be
> >applicable.
> >
> >Hope that helps to clarify the use case.
>
> This is pretty much what I had in mind, but I still see it as a
> server-side situation, both from the spec side, as from a personal POV.
>
> The DC the client connects to should have all the info in-place and
> ordered (either by site location or by cost) to return to the client,
> where it will contain the highest priority target as the first entry on
> the list (that will probably not be itself, see below).
>
> On Windows Server, you can create a registry key [0] on the DC to force t=
o
> put the logon server (the server the client is authenticated to) as the
> topmost entry on the DC referrals list.
>
> This behaviour is disabled by default, and the reason (as I understand),
> just like your proposal, is because it would defeat the transparency that
> DFS offers; the client would be "forced" (either by manual input or by
> discovery) to know beforehand where it's connecting to, where MS-DFSC sho=
ws
> that the client shouldn't be aware of such details.
>
> I haven't tested, but I would expect the DC I'm connecting to to offer
> the closest targets, no matter if on the same domain, different
> domain/same forest, or even in a forest-forest (with a trust
> relationship) scenario.  Do you have a practical test case where this
> doesn't happen?  OS type and version, along with an overview of the DFS
> setup would be helpful to analyze as well.
>
> [0]
> add/set HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Dfs\PreferLo=
gonDC
> (DWORD) to 1
>
>
> Cheers,
>
> Enzo
>


