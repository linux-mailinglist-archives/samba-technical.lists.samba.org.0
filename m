Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AAF19A4E2
	for <lists+samba-technical@lfdr.de>; Wed,  1 Apr 2020 07:43:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=qBlwGX3SMVHSvvrbricDr/T9GCDxeCXgokh5OVrRx1E=; b=3C5blmHJnafux3aNXvWyIq1OXB
	qviwS4eZWmTjGOA8uviZHx159Ao9rgMktFrcwkv1Xpy4E7YmEYHkwNfKy+51cGgi+kEgRpqydLo4R
	KwdDUtdqAtkaMvDzhukOCF1HMyiyHEAJHFA9ojmkKOMszCh1rqR5uV5rfdgbO3EPqX4nUqgXx/s/m
	wjlcchVkQxHUPA/3ifC07MprCqoybhbCIxTax8HDpxUCyLS5H3ZCl4c+UMncUSSmqjwzz0GakAvWF
	2A7P/Gi3yn9R3O2PYb0Z20Ms05krAaP9B0JNvho6I6yfCs+XnqbRoZ46jCk6qNFJv9IUAFgiWUe49
	KNMmy5DA==;
Received: from localhost ([::1]:62218 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJWA3-002x7s-1e; Wed, 01 Apr 2020 05:43:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18612) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJW9y-002x7l-0Y
 for samba-technical@lists.samba.org; Wed, 01 Apr 2020 05:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=qBlwGX3SMVHSvvrbricDr/T9GCDxeCXgokh5OVrRx1E=; b=ZxBBPjrnwe2//TnAEZvjgvJXZ8
 zd0LQWxTEnCe1q0Lfrgzl4xjQLXRQp6McbgWjPgZgi3vvdQ9PdJeRyF2g6k2zVObvw8mqw7T/ECq9
 ymDfw3syBpOzPfPQjTLQPS+jn6fhFcbMT2C8nr7zMIk3t8+hVJ8Fc/pPmqFje8+S0mImIMNx4P+KL
 YyGn5Jo4yYmFDRAO2wDgSBLYaFqsvdWRPgQLM1pnmFbaSQ3VRQTgtnqkQrYnUPNzEvIBj43oJbIuo
 Jgf8OTw4v9GYmmcEgjmI6gf1m7F/aNi7bFgETcPU/osQlg+v6aZQPqWHzzt4T/2RLL9GYHcRc3vat
 fkp1QwZbtDGiX5q4S0YD7DXj5DBj/2ZoWIe+VLUYslXCR6PF3AEYLywQLs/V8+tFJ7WcOjw4D7vTV
 IpN8i+qK9BtfoCIaZIJPgvHXFShKv45UkMID5yAPrPrJS92Fj8N3GrlLBRDqJESudJHGXxFeQLUHS
 u/gplS7RIIpqlzaHaison4n8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJW9w-0003EM-UB
 for samba-technical@lists.samba.org; Wed, 01 Apr 2020 05:43:29 +0000
Message-ID: <e8419b2342242a39ad6d34e96c0857ea5cf18c26.camel@samba.org>
Subject: Re: GitLab CI outage
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 01 Apr 2020 18:43:25 +1300
In-Reply-To: <ff467d0c1bca19cb97d0668beb144888a21860e7.camel@samba.org>
References: <ff467d0c1bca19cb97d0668beb144888a21860e7.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-04-01 at 18:22 +1300, Andrew Bartlett via samba-technical
wrote:
> G'Day folks,
> 
> Rackspace have again removed the disc image we boot our GitLab
> runners
> from so I need to rebuild.  This is fully automated but will take up
> to
> a couple of hours.
> 
> Apr 01 05:12:58 gitlab-runner-rackspace-0223 gitlab-runner[13699]:
> ERROR: {"forbidden": {"message": "Not allowed to boot from requested
> image", "code": 403}}  driver=rackspace name=runner-lmzam-uz-1585717
> Apr 01 05:12:58 gitlab-runner-rackspace-0223 gitlab-runner[13699]:
> ERROR: {"forbidden": {"message": "Not allowed to boot from requested
> image", "code": 403}}  driver=rackspace name=runner-lmzam-uz-1585717

Sorry, I think this only impacts backport work to Samba 4.10 which I
was doing. 

I need to parametrise the 16.04 image IDs here if I can't make the
14.04 image just run on the 18.04 host like everything else does:


https://gitlab.com/catalyst-samba/ansible-role-gitlab-runner/-/blob/master/templates/gitlab-runner-register.sh

In the meantime we have a freshly built runner which is a good thing
anyway, it catches up on a couple of months security patches etc.

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




