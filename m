Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDCD3B5ECC
	for <lists+samba-technical@lfdr.de>; Mon, 28 Jun 2021 15:18:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=C/ukqW4swb5IWLs/cea/yG2hTdmJhOm8s84GU9+tjUg=; b=I389ktif3wnLWpdoiPuftDl5J1
	pfTON8s4fA53r7hCn4JLqPwERoW/uQlVurqn5Fb+L31TKa//cNpsgwv0bYvcdzpHbDrGrkHyQdsM7
	ZX7NEVjfKYB2grexdSd8OPLyxcg5fvWOcrnarenBXz56q6YgDz7NKdMjF8pq09wKvlMh4dcs1LimV
	jrL1tcFMjToeikZz3k3zRQ9UHMQL/SjA+xWCASiyzIRZzzbdnwIpuJ3U++0DpBIvMPL+/JK9FfDKg
	GDP2pLsnQz8iXnv+4/IXdRIhMSvndpdqyAPHSpIy21lfttIcXb0SYTRgFLfBwgfGVIJhewW0X3qvm
	odsgJICQ==;
Received: from ip6-localhost ([::1]:60082 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lxr8p-008j01-3X; Mon, 28 Jun 2021 13:17:35 +0000
Received: from air.basealt.ru ([194.107.17.39]:37102) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lxr8j-008izr-AD
 for samba-technical@lists.samba.org; Mon, 28 Jun 2021 13:17:31 +0000
Received: by air.basealt.ru (Postfix, from userid 490)
 id 0D77258988D; Mon, 28 Jun 2021 13:17:24 +0000 (UTC)
Received: from [10.64.129.4] (unknown [193.43.9.4])
 by air.basealt.ru (Postfix) with ESMTPSA id AD18E589885
 for <samba-technical@lists.samba.org>; Mon, 28 Jun 2021 13:17:22 +0000 (UTC)
Subject: Re: Implementing Samba in Containers
To: samba-technical@lists.samba.org
References: <5826213.lGaqSPkdTl@edfu>
Organization: BaseALT
Message-ID: <d42dc27e-41d6-a63c-0079-f6bf7c0947f9@basealt.ru>
Date: Mon, 28 Jun 2021 17:17:22 +0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5826213.lGaqSPkdTl@edfu>
Content-Type: text/plain; charset=utf-8; format=flowed
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
From: Igor Chudov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Igor Chudov <nir@basealt.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

At BaseALT we're interested in running Samba in containers for testing 
purposes but mostly locally, in Docker or Podman, not in Kubernetes. We 
will be glad to join the project but I'm not sure how we can help.

Have you any experience in running Samba containers orchestrated by 
OpenNebula?

On 28.06.2021 3:20, John Mulligan via samba-technical wrote:
> Hi List,
> 
> I wanted to follow up on something that I learned from a thread on the user's
> list [1] recently.  Specifically, that I'm not the only one working on
> "containerizing" samba components.  Some readers may be aware of my container
> efforts if you attended our talk at sambaxp, or saw the recording [2]. While we
> focused quite a bit on the Kubernetes parts there I want to skip over
> Kubernetes in this mail and focus on the (OCI) container images.
> 
> Michael Adam started a project [3] to build container images for Samba. We
> publish our images on quay.io [4]. I have
> been involved there for a little under a year now. We mainly have been focused
> on our immediate needs but I wanted to reach out and see who may be interested
> in collaborating on containerizing Samba.
> 
> In the samba-containers project we have three images that are built:
> * A file server image
> * A client image (smbclient)
> * An AD DC image
> 
> The file server is my main focus for our Kubernetes efforts. The other two
> images we are generally using only for test and are currently very simplistic.
> But I'd like to see all the images become generally useful, so that's why I'm
> writing this - to seek out any parties in the wider Samba community who may be
> interesting collaborating on this effort - or even just discussing
> containerization of Samba.  I would also like to re-emphasize that despite the
> name of the Org in the project url, none of it is meant to be Kubernetes
> specific. I'd personally be thrilled to see it get used in other contexts, with
> other orchestration systems, docker-compose, or direct docker & podman. More
> eyes on the project from others who aren't focused on k8s can help keep us
> honest. :-)
> 
> In conclusion, I'd like to hear from anyone reading this if you're interested
> in samba in containers, even if you're not so interested in our particular
> efforts - but especially if you are :-). I'm curious if anyone wants to know
> more about the nuts-and-bolts of how we're designing the current containers
> and if you have feedback. In addition, if you are already running samba in
> containers or have your own images, I'd love to hear about them and any
> challenges or successes you've had.
> 
> Thanks for your time!
> 
> 
> [1] - Thread Parent: https://lists.samba.org/archive/samba/2021-June/
> 236451.html
> [2] - https://www.youtube.com/watch?v=mG-Jxaf8_gw
> [3] - https://github.com/samba-in-kubernetes/samba-container
> [4] - https://quay.io/samba.org
> 
> -- John M.
> 
> 
> 
> 

-- 
With best regards, Igor Chudov
Lead engineer
BaseALT, Saratov engineering department, UTC+4
tel. +7 495 1234-7-99 ext. 549
mobile +7 937 266-51-34

