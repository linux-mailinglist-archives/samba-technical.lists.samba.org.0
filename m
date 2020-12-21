Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B62FC2DF80D
	for <lists+samba-technical@lfdr.de>; Mon, 21 Dec 2020 04:39:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=NtoVVcZXLVa/axZC4Otg8apzFZ2jyV4QjwB/5DnnxWw=; b=p6wxQXFglarHLyOsD3Qk8kon0E
	04jqCokERCqPbmM0hI0AnKsFcq7VtWUvhP/ROTWopgMvdj15kPg8NLMSu4RuPrq+86QFWi8IMSlQZ
	EYZnahTXV0VJWHIBdK0y8zOKhq4qmgrRk96ubfz3Pj/n6espgRyBw48De4NlM/x1jeB85x2uO93XD
	cOW4hzGPCaHYhBIFsj7EFgiF6kEpvXLVp6Kk8oz6h5DCfc3MQo+PJmSKC80GD2/QP4fozWvAiQnFC
	bY3XeG9X9sMl9QlIHU88NGOe5zHuWJx+b84GexpebgR84BOVbQcXoqrbdeDWgxkw4ZBgKjwY0doQa
	m7EhSvAQ==;
Received: from ip6-localhost ([::1]:61742 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1krC1E-0026qY-HQ; Mon, 21 Dec 2020 03:37:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33532) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1krC16-0026qQ-QK
 for samba-technical@lists.samba.org; Mon, 21 Dec 2020 03:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=NtoVVcZXLVa/axZC4Otg8apzFZ2jyV4QjwB/5DnnxWw=; b=TgjhAe2TPQZBWy9VRbTVKZA3hz
 xf5TQ5IsNhzvBRmVD0PCdUjgc5CGGYT5wRLLm65Cw4gM8MG+Ebwgutc0mLY0GuLxrpywB/FwFMWjB
 5PQXqcKo8DOvP2u915ZLgjXLiHWyrjlAFL6x75UOuULcwhgmh/2wZh3Y2ofGQLeyuKFFW4ohIMu8H
 tkQHmCU+HwDl6UAF9sErbW6JTUCalz+Udl2hkMnbMEfq72rYueWIh8qmq8l9cYIhMGjunGf29hM6Z
 mLaAeqdDvkpy14NH29j8YDOQ/UWRXdM/3LQN2HxPq8fyyH/80E8LG9eQ8wX4CuBmjIgCPoW3PixVQ
 dKqp27ykBvFbEtmlwCWHDa7n913nSrZp9jDP4f0BvwRgMcqgNoZQunXf/ScG7M7a16drmsL7X5dFa
 eGXuhKqUcbqT501Gqb4Crja4jXgnCrfEd9KYldI+xXAoghvYC912dP2t+Bvx74LeQ7RKZX7U9A0FN
 uiRUNGEjYhBtwghR9ZmKWEgv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1krC0s-0007h3-FE
 for samba-technical@lists.samba.org; Mon, 21 Dec 2020 03:37:35 +0000
Message-ID: <6bfb9cc51fcd259b4674587699e7345f57ac0608.camel@samba.org>
Subject: GitLab CI runner rebuilt
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Mon, 21 Dec 2020 16:37:29 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Just a heads up that I've rebuilt the GitLab runner in rackspace.

The runner has been simplified, the (unused) installation of Docker on
the bastian host has been removed, and we have moved to the gitlab
maintained fork of docker-machine.

(I tried to move to rancher-machine, but it fails in the rackspace
driver). 

Finally, I removed password authentication from SSH (which is enabled
by default in the rackspace images, ouch!) on the bastian host, which
should reduce the load from the attackers. 

I'm still hoping to move to OSU-OSL but I think I'm out of time before
Christmas and some of the tools are not working properly for me there.

If you notice anything odd, do let me know.

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







