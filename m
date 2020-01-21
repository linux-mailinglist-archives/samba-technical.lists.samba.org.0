Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F71143E22
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2020 14:39:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ZBvfDALe6ephrPqIBzEKl+dKZGebqS9qC/jpiItFMqQ=; b=K9Ao7u9GDOwS12wUqLyGFc4Y3D
	b0LIlTn1R0YTASdqJYRQNN95KcJi/80k8Y1F8cl0ZRU0Btki+sw5OxSMb/cq6gOQk6zjc5C3rl6Kp
	j98xIsTl+x04tLdLUaj3RQfjWsc/NH1NvCkQUk9uKCF5aJTE+V3GaK/sOkeI6pcGWq4cvCne34Wdx
	mcJ8GNTFz+bX7J4Ql57owY20k868ya+yw9MOpxshduLnPu7JgK4UjFT2Ayz/0q+h3DJDhx0dP7yzK
	MAydoROcpWP6b468x4/QfH8QKs5GR58YYWqosDBEKhRTe1aa2p2Ks+L1XlFkHwD7Q4fs3DEVbQZq0
	8BEVhopg==;
Received: from localhost ([::1]:18670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ittjm-0042JT-M8; Tue, 21 Jan 2020 13:38:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36970) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ittjf-0042JM-N0
 for samba-technical@lists.samba.org; Tue, 21 Jan 2020 13:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ZBvfDALe6ephrPqIBzEKl+dKZGebqS9qC/jpiItFMqQ=; b=kywtL2xe7CoAGYd8Lx4OReiIAT
 To2M43wMO7aB/3IDz6zMlApBFNEv9BFJdFOnWQg22iZfQbBNJ9yJN9aVHdJdKaszCQ/iK+yBaQ/ku
 YjUukRfSUhM60tJm/cu6wiZ52dhwuvk8vGFZnrywG+oJ4yVUDYStons9ZDDY5/XJVJCS6IObRbLV1
 CkWitzdS0yiJoFQHTj0k6j6flXfTO8QELvaJ1eYdmKLChUSKTTezuBizpzyJBfBUMglOq8zIhcAx+
 ReQFHQ2cdx1KEO+43JbMb9HTC8oRC98I7F8julXNelbkKG44HLLl+S2iFGD+DKx7kh/xqHwQS2Ueq
 6sHC1o81LSxFqkJAgiUMytMy0Dy1qHbF26ikY5Lrs+KuWiWhduHCM+tTeUwWZCL5u0/sdS4xhC0pN
 fRJgLljoRaBYF9Gnzw8eY5yfOnD2NZUlFzatYGRGdguqkNqcfEZ0jKgPMCOVlB2h5Z77909OWMx2N
 jkuWd+MTIy1QlhLtcLNys6WC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ittjY-0003J1-6h; Tue, 21 Jan 2020 13:38:20 +0000
Date: Tue, 21 Jan 2020 14:38:16 +0100
To: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Subject: Re: fuzzers
Message-ID: <20200121143816.302b849d@samba.org>
In-Reply-To: <0f82d428-6115-a26a-dfd1-02e79e573c8a@catalyst.net.nz>
References: <2546695.cijFyKqbAK@magrathea>
 <0f82d428-6115-a26a-dfd1-02e79e573c8a@catalyst.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Douglas,

Thanks for working on this...

On Mon, 20 Jan 2020 15:00:47 +1300, Douglas Bagnall via samba-technical wrote:

> Should we adopt a convention similar to our BUG: links?
> That is, add lines like this in our commits:
> 
> OSS-Fuzz: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=19395

Given that OSS-Fuzz is evident from the URL, would it make sense to use
a more generic "Fuzz: " tag? That could be reused with other fuzzing
services.

Cheers, David

