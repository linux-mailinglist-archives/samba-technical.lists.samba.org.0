Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B9F7D004D
	for <lists+samba-technical@lfdr.de>; Thu, 19 Oct 2023 19:13:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=G/9o//56DgfydVu4SqDAEW5FFZJyytbt0bu4dfhk77g=; b=Yr8G4nItGk6lsV6nl+fsiiW7CK
	rlwVoNslfU/0FOCbjYMo3vTxGdNF289shbk7F7zuG5R+F2rPYLdQq1H4a0EQu1gWMuxUgI54AMcVh
	HQIbVKp4jmfgJI2Cngm/+XPv5P4TNw0wLZ2nHMeowtSuFcf/UOfhBnhxjmsrs6keMCF8r1qnCD0XY
	h03NYQY6mtb/RI57IKh6kj5soO4m5SiFbDTQBPvy+u3kVAL9aRufCXn3j+zxnqLvOjvOkhFxSvOb6
	6hmmqUgWBHgb6WclQ2pmkiCKLgrpoSQVm2WvJSwM4oatXXz/gyqqVwLlCg+dYhcOTYvBwRhM3i7bo
	4KuesrjA==;
Received: from ip6-localhost ([::1]:19880 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qtWa0-001MI4-34; Thu, 19 Oct 2023 17:13:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24682) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qtWZv-001MHv-LJ
 for samba-technical@lists.samba.org; Thu, 19 Oct 2023 17:13:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=G/9o//56DgfydVu4SqDAEW5FFZJyytbt0bu4dfhk77g=; b=TLiBeoGN59cas3twQlOsqtM3zD
 EcpPrHs0XH99KNJXTNGkdzC8VsB6G+Jqvg7ALVWIsnZ0NH1OYXlJDtniC+ueE6eE+eHHN15h/eBN/
 juztuRA76CENSZ+G39MZOcjaUxaRmf/IhKMipjnp1DcB3QHYYJVrijIZ9FKXHrsqHOg8BWW5xJpjU
 yeVn/ItfSWGOW8jY5DrubdnXx1I3u7UlC/pTixW6GCUEr5ZIDnScIMBWLMK50qT+pvZXviB1GEGZE
 uRc2MYjkZ47ydG4mvcSW+khyUgMoSPT3Lk21JzdqcPsfdYHQZB5Dl7uxmVaQnI9F+fyA2ko+keXsJ
 UydsdnFESFkBLXBSorHVi/7zyRHz1pZw1vL2/WFP0ktuYtl8ijQNcqv+ACReRE1lkBzPIh0/OynGT
 xE1P9xOlgT/MoA3HSEUKnqwmTkW5aVF5+joSWSC65ddeSubkwr/6Fk0DEzAfuTJP+NUUlJ3ok+5km
 d1blRDXqNIgVC6sUgbvzpOeM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qtWZu-001XG4-2P; Thu, 19 Oct 2023 17:12:58 +0000
Message-ID: <ca9e50c5-ba42-7a3e-9158-24a08ed42512@samba.org>
Date: Thu, 19 Oct 2023 11:12:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: SMB3-POSIX: Move section 3 inside section 2 as 2.3
Content-Language: en-US
To: Ralph Boehme <slow@samba.org>
References: <bb0a36f1-609d-4cb4-984f-be377375b3c0@samba.org>
In-Reply-To: <bb0a36f1-609d-4cb4-984f-be377375b3c0@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>,
 samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 10/19/23 11:09 AM, Ralph Boehme wrote:
> Hi David,
>
> what would be your thoughts on this one?
>
> https://codeberg.org/SMB3UNIX/smb3_posix_spec/pulls/3
>
> @Jeremy: do you think you'd have some spare time to work with me on 
> the section 3 server behavior stuff?
>
>
Fine with me. Ralph, I've made you a member of the project, so you can 
make any changes you like now.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


