Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C76434248F
	for <lists+samba-technical@lfdr.de>; Fri, 19 Mar 2021 19:24:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/JowdfmmKpJB2UBSTcR6azLdFzLXy9ucnNQoBlcRC/E=; b=B+eXcbrWK5nkSd73o0YKAGY6li
	l3ahJs/nJPx1Cbj+bb2GpbsdcRMU8q4tYvT5lbHBaBh68chttwJUI49dm5wXLmsczpKjmIQwC/8df
	U5SlJtc7D7vhcGiE63fvqK232kv81yJqWUtXpjVyjq//JpGuJwfFxzf8TPNQt+PjufPEGDjH2JkVb
	1+rxhY8OTW72sgTKRAZONQsIfGTRYQN3HAfKYkZr5XcP1enVDltSegjndOC+tFlYLuu7PJZwBo4TW
	IjcERQ5om6Fc+dVbhtG8M92u5Oacazqxm1jK7KLN2oE+3d+GMCvX0A5W8ul9iLgtuYwQlmgGNUPd0
	VgQWePIA==;
Received: from ip6-localhost ([::1]:47260 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lNJnU-0064vw-B3; Fri, 19 Mar 2021 18:24:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39534) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lNJnJ-0064v6-B5; Fri, 19 Mar 2021 18:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=/JowdfmmKpJB2UBSTcR6azLdFzLXy9ucnNQoBlcRC/E=; b=Zbya7M2pufasWggle44EBhHIhZ
 arXLSRGM23ZNxOYJQzR5mfGbAz2hV+0LlJEaOjsg5MYgPTpKbUgsOuC8pNxDidChmSjq370ZBpWfo
 WRVctCVWPuFN1kQeQkYGWMAn5rgYbb6MKzbiE+bJUlhxdNKYtqlsvLm07vAXIVPmkokY5BJdeUJAe
 4ykkgXxvAyjaRmXY5l8FtldkWoAUK8sJSqvx+cwQrghjxtnyu9SL9eXlmM+o+CKHR/oOELvg591A5
 2FWajqaLAyVqK6Sa2YYh7PKQWnB4E5DtUg10bq8frez/rgWrSWVLcjfWc9mKwofittqcgQqJ4Ufz2
 //QedM53kZI85UR9z+MaqP39GkZZIUroA/wV2RSNuA1yEO4n1XPFEcI8kKSnJEjZHYr61dP/XvVwK
 9KB3hA2mkvy7kNWxSCjuvEy0mA73XH6/k6ekGpfUivn3/DNoR+WSgL3II4O9VJ3L5QeaKuJd/y3VZ
 DYK7edbIQ/a0iKjRGn4953up;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lNJnI-0005Hk-B3; Fri, 19 Mar 2021 18:24:20 +0000
Date: Fri, 19 Mar 2021 11:24:16 -0700
To: David Mulder <dmulder@samba.org>
Subject: Re: Ask not for whom the bell tolls HPUX. It tolls for thee..
Message-ID: <20210319182416.GD310511@jeremy-acer>
References: <20210319175422.GC310511@jeremy-acer>
 <K2A8QQ.ZR62NCP7NX2F2@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <K2A8QQ.ZR62NCP7NX2F2@samba.org>
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
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Mar 19, 2021 at 12:01:32PM -0600, David Mulder wrote:
>Wikipedia (on the side panel) says the latest release was 11i v3 in 
>May 2020. Not that I'm arguing in favor of keeping support for it 
>around (last I used HPUX was 5 years ago).

Oh, good catch, that's an inconsistency.

The two end-of-life dates for 11i v3 I
can see are:

2021-03-31	HP 9000 only
2025-12-31	Integrity only

so the end is certainly coming soon.

I'm going to wait and see if anyone from
HP(E) posts here and actually cares.

If not, off to the glue-factory it goes... :-).

