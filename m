Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDF755C522
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jun 2022 14:50:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=18zpT/jthTcr8VQrjep85MznNrpJeQz0dIpJoLq+Hug=; b=a4p95yrnRXYn31wSHhIxLnUd2L
	N6D1+OaqmVxP61iLzuBqap5pZR4y+Wx3ES1ZS/BrSqS1kdOFz2L211AVHFqhSWeWrlYd3S1yJOwQe
	5KCfZyqh5LL/Cp6AhHnfu/Z0S4uZkxVMgHDvmFaXazYzrdac2tXLDWzA8zm/XnzuaIk+xANcNmYX6
	aLnSHl7rJZQOPw7kbdzKeiwJByaryFa8Sd9FG67BxGgjYeELPO5S+wCXUIburBF2oeZPZTjC4PNWF
	oIRYoKKapJkJLFFX72c7E/lfKtfKD7LR/8gsYV7ecXhOZ/TWFxx3HAbfv1AnfJGhKSfopDSZtlZrB
	bzR4t/fA==;
Received: from ip6-localhost ([::1]:36934 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1o6Afk-00DBMq-7G; Tue, 28 Jun 2022 12:50:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31022) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1o6AfU-00DBMh-TU
 for samba-technical@lists.samba.org; Tue, 28 Jun 2022 12:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=18zpT/jthTcr8VQrjep85MznNrpJeQz0dIpJoLq+Hug=; b=F1SRSXv8MVC3CzFfx08zdlSGDT
 8nMORQvF1/YCqL4S0h3JzSequMac41NtofaoL6MNMOSxXTGILKpmEVna91f9cCmV7DFl3SWnKD7li
 iFv4mIHqF638civ0uN7kWj4p3kn0gNnDEwszKUOa/zzJQAFCKOqaNbjMKcEADTitX0z8Y+uJufJUo
 Yn9dTW1H6uCL5kZzpGBuR2rd40qc+2dHO0RZck1PtMeCCubLbi73hFwKRbDZ9IfK9zNxTKkwkuROK
 Gvs6baRoV8Etuh2zINbwLj3Ssz86wMaOGTIrpEmf149Z1WKMapxZUWXZlb3xjVYTBhob5624Tme+Z
 mR9JjJ616oZRCz61CVgzZADlG40g/oiVNi/KcIHO5/+a82VyIhfiwMBZeA/O571a1I0xHVRE8mRh6
 MeyGpoCoQdjKyD43E7tG9sqU50MhHHIxTXf+bi82zBPkFLenATpXaaetT0A2z2n7FeFX5kbUOz6vq
 gKt+BwJFEZekZ/xekXF+TxJR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1o6AfT-00276F-PI
 for samba-technical@lists.samba.org; Tue, 28 Jun 2022 12:50:12 +0000
Message-ID: <002a98fbfe8742f13b5d975e4db80ec37a6bcf3d.camel@samba.org>
Subject: Re: Expand groups with Samba 4.15
To: samba-technical@lists.samba.org
Date: Tue, 28 Jun 2022 13:50:10 +0100
In-Reply-To: <07c7040e-f4be-a6f1-5c50-80db9f39c101@univie.ac.at>
References: <07c7040e-f4be-a6f1-5c50-80db9f39c101@univie.ac.at>
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

On Tue, 2022-06-28 at 14:23 +0200, Robert Weilharter via samba-
technical wrote:
> We have the following AD-setup:
> 
> Domain: USERS: Most regular users and groups exist in this domain
> Subdomain: SERVER.USERS: samba server is joined in this domain

I take it, that by 'Domain' you mean 'netbios domain'. if so, you
shouldn't use a period in one, so your netbios domain should be
something like 'SERVERUSERS' or 'SERVER_USERS', a bit late now.

> 
> smb.conf has "winbind expand groups = 1"
> 
> After upgrade to 4.15 (latest version on RHEL 8) "wbinfo --group-
> info 
> USERS\\somegroup" did not expand groupmembers.
> 
> Reason is, the default for "winbind scan trusted domains" changed to
> "no".
> 
> Queries for users in domain USERS with wbinfo still work as
> expected. 
> Most queries regarding
> groups do not work at all (group not shown) or give incomplete
> results 
> (no group members expanded).
> 
> All queries for users and groups in SERVER.USERS work as expected.
> 
> After setting "winbind scan trusted domains = yes" everything works
> as 
> it did with version 4.11.
> 
> The release notes for 4.15 state "`winbind scan trusted domains` will
> be 
> deprecated in one of the next releases."
> 
> In our current setup this parameter is needed.
> 
> Is this expected behavior, or should we report a bug?

Probably both.
I came to the same conclusion yesterday while replying to a post on the
samba mailing list, I was awaiting a reply to that, to confirm it one
way or another. It looks like I do not have to wait.

Rowland



