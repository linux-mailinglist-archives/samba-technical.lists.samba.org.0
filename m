Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4393808FA6
	for <lists+samba-technical@lfdr.de>; Thu,  7 Dec 2023 19:12:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=6Nqs8UVnWo0Vs+ARTXh48J1b7B08lcg4/Yr5AclakK4=; b=gBKsqBAgDGJXWewQovCwHOdQWg
	pJbZJvhPipIcgFsMTZosMROPUyUOVBR+7r73/tSOGJ/4zvkI5iJIYjR3zBOUKfH1Mv2fBu6nJ6rem
	8RUG2oqVa2KatSxLKyuAC8NGOQC7oxhkRcqg8FcRYCOuslZy35VF0OEKTyHeWsQi0pFTj3sbt7O2r
	M/IANFZpjI7L4oiDnUcgpFD33mZzd4u0ES/ERYI/Uv+/bjP6AHuEoJYNLXtP+NznZjE905bq1Lvuq
	rDwRoud0Izm/DMkcBN4UR3T3xBW3K5BOL20OPv+uVqlcSxcMSb+LBA2xZqFVJDOjjvKgp2LyxmUIH
	hzEonKhA==;
Received: from ip6-localhost ([::1]:29282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rBIr8-00516d-09; Thu, 07 Dec 2023 18:12:14 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:40674) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rBIr1-00516U-Mb
 for samba-technical@lists.samba.org; Thu, 07 Dec 2023 18:12:11 +0000
Message-ID: <2c1db0b4bfc23db7e1f2a70ec7ce32dc@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1701972724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Nqs8UVnWo0Vs+ARTXh48J1b7B08lcg4/Yr5AclakK4=;
 b=lM/NEk+jqkgjLsqctH6f+raDQ4iVihU6VY5cHFHon4HhG4eVE5dECuNWZZkhnDTOwDz9gD
 zznGsA4qiij/ebN1p+gW0WbnyVo87filoy5jNR8asXvd6/nW9psOEav9voWKNcQBUxojkE
 TwCCS4HqrtVJkBXB+9eDEhgbU/t0+l58B6sykYmqFkQtZNrY88Dn5rUc6OptAkCedFqnHy
 cjlkaF67HYjD5FTHbc6JcjTfbzrgZXogfBAoTGxkaocXdpgw6hufr26AJOptcGB9cbyTut
 jn2o01oWe2bpaiGmrbFdyNBped3gVWU91Aja3hqHeGuiKF87ZoRqRQTwDrhc6Q==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1701972724; a=rsa-sha256; cv=none;
 b=BE/6o2kW2U2DO20Tha4+4ToHFMkq1K0wKIbqfUZnoE/BaXQ99VsjvOGmxQnuVhW+MkKebm
 vQ5QSYPXU91d3zkhbBHmhAf04byyxkL8DAB4IwpeDcVau8dAud82O3y4YSHziMY9dRjcz4
 sK4pgA0OI+CwgNCNNFF/ELFIeo9Nvi64bmPq0pmbtP4I90pp5uW72CFhV4Hcbjr3jcbQ4N
 jEIPG47gYKkflbokLsskg1buY91P+lHfDRV0IgscT94js6trcmfAQBZ8hanhr18mUqy4et
 RMWeZzpdMcYKhtGWzXxuVjO7sIGF2/YJ8lguAm6PIhP61D1ZINejw/o5iT6cOA==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1701972724;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Nqs8UVnWo0Vs+ARTXh48J1b7B08lcg4/Yr5AclakK4=;
 b=UTlRAfp65YpX02QY8qExgum4fzElwCTlBm+GbOOvAMLCRtaRhutdp4uOaJRRpqgcka4OoT
 1yt1guxS9NeugLTEZWl1TBBkFL/MzZuc8nxLj3sWiEQPH3mYXEA2JSSsGiHURz0o4CLQaY
 eA0DG1Nzbx3kB5XDXeypAiquJSXy5zeCxvdczvsPlJkpvAQglLLyTBYUbBDk/crwurkQxH
 Ns8blTmRrsjZAffRdn2AsbQF1+JTdtxuXWfpqzaZKbovyL/Vri5fLeEiUkmBZFeol5gbLw
 GVD3VRmxRmt8TWDa/62RrPXTpYWJ8ZRlP8Zpy985FNt3XjGLJCy5gUVDoF66kw==
To: Jeremy Allison <jra@samba.org>, David Howells <dhowells@redhat.com>
Subject: Re: Can fallocate() ops be emulated better using SMB request
 compounding?
In-Reply-To: <ZXIDgvZ8/iBhYXwy@jeremy-HP-Z840-Workstation>
References: <700923.1701964726@warthog.procyon.org.uk>
 <ZXIDgvZ8/iBhYXwy@jeremy-HP-Z840-Workstation>
Date: Thu, 07 Dec 2023 15:12:00 -0300
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
Cc: Stefan Metzmacher <metze@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, jlayton@kernel.org,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Jeremy Allison <jra@samba.org> writes:

> On Thu, Dec 07, 2023 at 03:58:46PM +0000, David Howells wrote:
>>Hi Steve, Namjae, Jeremy,
>>
>>At the moment certain fallocate() operations aren't very well implemented in
>>the cifs filesystem on Linux, either because the protocol doesn't fully
>>support them or because the ops being used don't also set the EOF marker at
>>the same time and a separate RPC must be made to do that.
>>
>>For instance:
>>
>> - FALLOC_FL_ZERO_RANGE does some zeroing and then sets the EOF as two
>>   distinctly separate operations.  The code prevents you from doing this op
>>   under some circumstances as it doesn't have an oplock and doesn't want to
>>   race with a third party (note that smb3_punch_hole() doesn't have this
>>   check).
>>
>> - FALLOC_FL_COLLAPSE_RANGE uses COPYCHUNK to move the file down and then sets
>>   the EOF as two separate operations as there is no protocol op for this.
>>   However, the copy will likely fail if the ranges overlap and it's
>>   non-atomic with respect to a third party.
>>
>> - FALLOC_FL_INSERT_RANGE has the same issues as FALLOC_FL_COLLAPSE_RANGE.
>>
>>Question: Would it be possible to do all of these better by using compounding
>>with SMB2_FLAGS_RELATED_OPERATIONS?  In particular, if two components of a
>>compound are marked related, does the second get skipped if the first fails?
>
> Yes:
>
> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/46dd4182-62d3-4e30-9fe5-e2ec124edca1
>
> "When the current operation requires a FileId and the previous operation
> either contains or generates a FileId, if the previous operation fails
> with an error, the server SHOULD<253> fail the current operation with
> the same error code returned by the previous operation."

David, you could extend smb2_compound_op() like I did for compound
create+{get,set}_reparse+getinfo+close in [1][2][3].

[1] https://lore.kernel.org/r/20231126025510.28147-2-pc@manguebit.com
[2] https://lore.kernel.org/r/20231126025510.28147-3-pc@manguebit.com
[3] https://lore.kernel.org/r/20231126025510.28147-8-pc@manguebit.com

