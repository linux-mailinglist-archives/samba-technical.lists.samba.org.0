Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 526B65EAE19
	for <lists+samba-technical@lfdr.de>; Mon, 26 Sep 2022 19:22:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tjDSHefTG5cyVrWuDonCP9TQwuUByUTt1H5ko2WpMmU=; b=AcV1db0eKytEp5i5f5jpQvEUdz
	POGm1OWEcChJYzmJKpvk3tqaC1gcLi2Lft9AXt5MIygy/Lu2i0wYduO7TPtfBwvY4CA1DavYh1qTa
	T+PTCyJZD8D/2cVPewMG6Rw+xP+eFkAGaFn7OTxKNr5wbBgCnGFZ+iJPNn1xHXialfMZtuaT7p6w+
	m/La2B8Cn9nDRiiAlBKgjhX7jhD22QehlkHLnQq77LgS+L8IT43SJLqOfqWaMhXGGFGEhleyWnrMh
	0UM2ZTSbAMjIxe8yOW0ilYyPQrdf5oIaH9n4EIy3Kh0Vt90+4wlUPjnW1du8WWrEqNGrsAUIJ7bKy
	Y8JanZ3A==;
Received: from ip6-localhost ([::1]:60890 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ocrol-004HhA-Nv; Mon, 26 Sep 2022 17:22:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22842) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ocrog-004Hh1-7O
 for samba-technical@lists.samba.org; Mon, 26 Sep 2022 17:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=tjDSHefTG5cyVrWuDonCP9TQwuUByUTt1H5ko2WpMmU=; b=TrF1tWpUjucxuNPR3WPVurXAhh
 TdUWIdiY8qJT+5Qys9GXACp1u/nUeOHGHk7vIHYvnSrsFTP0OiO4QmyndNj4yBmUuB7CXzAO+ANPU
 yp5b6YPjOXBf8a5dJib4B8BptdwahmtFhrBsZ/rAcyNPE13GZpfy5yXtDQDo+fzsOxiCNTObv7Xeq
 szrRaMfXoETx8GmcxIXKAqXg/7AA4EiIVURH13EF6zA7tz/1J848aAnePHvC2mJJHpAro7zgZNr5/
 tp8f/uIC0F/MAXviZEqGxvjiQcgKEOSwDTTEJMTQNvzsad7/uyEOV7zMP0DIHHhpJEInvnZo9IOk4
 g9XXZEl4FL7nN6Da7HvNXOkUbybNVK3+uPu4eGT+dcihJRkYovuKWrRchkB70jLPzry9SRwKdtbH1
 kg05fSFY0jV+6nnTert5vgSQAJ22SCXvlgZhXZIYJo5aQa/5iZ6LIWtXTBSDuACyfub0c1WdOcAPr
 ZZsldq7XkNE94GSTIt1FL/uq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ocrof-001ziX-DW; Mon, 26 Sep 2022 17:22:49 +0000
Message-ID: <4dca43ef-e5c8-90a3-40ad-425c7cd95fd0@samba.org>
Date: Mon, 26 Sep 2022 11:20:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: SMB3 Posix Setinfo class?
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>
References: <eb0a59e3-6f29-4059-8278-2eca8a57c5da@samba.org>
 <YzHfmxSCB34UwCz+@jeremy-acer>
In-Reply-To: <YzHfmxSCB34UwCz+@jeremy-acer>
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@samba.org>
Cc: Steve French <sfrench@samba.org>, Tom Talpey <tom@talpey.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 9/26/22 11:21 AM, Jeremy Allison wrote:
> What specific attributes do you want to set with
> FilePosixInformation ?
>
> The file mode (rwxrwxrwx) is set by a normal
> SetNTACL request with a specially formatted
> ACL.
>
> I can't think of anything else POSIX-specific that
> can't be set with a standard SMB3 setinfo
> the same way it's set on a Windows handle.
>
> I don't think we need SetFilePosixInformation
> at all.

Good point. Fine with me to simply remove it. I'll make it clear in the 
document that FilePosixInformation is query only.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


