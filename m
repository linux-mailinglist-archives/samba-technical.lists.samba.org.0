Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD32B57E3E
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jun 2019 10:32:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=PkOMbxbfyg1u3h+wc3/QnfxE21rWHZE/vrieH6zUePg=; b=CL/7WtnmQKKkdiGLOe5nCINzw0
	hxwmkoHCD1b9UtG1vQFgVsNxs2jLNrgMRbYM3MOEeK4Q95gTE+J86Jgc6rGl74rkKswRMHHNhBUTC
	yvs6l0uwUWxOwghGAyIJEA0luEG46VP6exH60f3/zwXR+tRbLAqLr3p4s57BJ2W3cHt8svVAQpPdZ
	sOZHERpS3aQklVDnMK44w6Q1nCLmtFQofMxbwyKUJW4xdBo+DAYMUID11iV6xue2S8c0Cv0FT0o9e
	O6IZIKQzRmyew2f8fWlRNd/cIua5sUbnqerncI3RcSnjxYBX0uorIWQcYYnqLVP6Kddfz0YpQi0RG
	EYjHDZug==;
Received: from localhost ([::1]:50614 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgPpX-00269h-QK; Thu, 27 Jun 2019 08:32:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37904) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgPpU-00269a-2f
 for samba-technical@lists.samba.org; Thu, 27 Jun 2019 08:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=PkOMbxbfyg1u3h+wc3/QnfxE21rWHZE/vrieH6zUePg=; b=mJAt5oUtCQpaG7HK53Ia52ZdPA
 4epb28xgHtW2SGPjAMDqyK/Yg3hx1zk8oMqWpZ21FjXGKxYFWfJrMQgFWTeLt1SMmiupIvb66ormk
 hgWsIqB2lac/IVsAdZ1Q0xCY2aHZiyiINvWYru1vFGcF45dvWihxHaB7B/UHrryf7C2A=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgPpS-0002DI-Oj; Thu, 27 Jun 2019 08:32:26 +0000
Subject: Re: [HEADS-UP] Using stored immutable file birth time for SMB File-ID
To: Jeremy Allison <jra@samba.org>
References: <20190626135745.lk7757wmy26pgy26@inti>
 <20190626181233.4fc61c42@samba.org>
 <c37b59f5-8a89-eeb2-8f92-7db2c7524efd@samba.org>
 <20190626204626.GA15143@jeremy-ThinkPad-X1>
Message-ID: <585ba57c-c358-bd45-7fe7-2d362b1b90c2@samba.org>
Date: Thu, 27 Jun 2019 10:32:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190626204626.GA15143@jeremy-ThinkPad-X1>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>,
 Volker Lendecke <Volker.Lendecke@SerNet.DE>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/26/19 10:46 PM, Jeremy Allison wrote:
> On Wed, Jun 26, 2019 at 07:59:08PM +0200, Ralph Boehme wrote:
>>
>> Thinking about it, I will go and ask MS what their client uses the
>> server provided File-IDs for, if at all.
> 
> This was just touched in by the MS SMB client team presentation,
> the File-ID's are used to uniquely identify files in their
> buffer cache I think. They have to be identical between the
> different query methods at least (that was the question that
> was asked).

oh, really?! This means we screw their cache with our current inode
based File-IDs as well.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

