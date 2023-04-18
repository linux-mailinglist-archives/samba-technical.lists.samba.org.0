Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F78E6E58CC
	for <lists+samba-technical@lfdr.de>; Tue, 18 Apr 2023 07:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=jdNpLOmr9SA7luiVxAu1rLS+xjLDxLf/7vARul4yWgY=; b=rIFJu0jseAb5xrU6V3yOqSCFJu
	3fEIgdT4ozBd3r0NzPIrzDol3+PwgHBgvJYe6RwVDxngOwq7a5PTEnGyeRZbKw4afujoX09Y0X5lS
	3F4bGjUvpb7w9UShfju6Weh2WKR4/m/J5c8siGBZW4daFfjVDDzz07P6SXYi1CZjzbsuZU9+/RawQ
	sul7M7I1cBMQQt78C8NiCzVMsRJU7w1IDQMzhDiUKQ8n8cyLelgk+/2Hvw/8eqe3322JON9fCarPk
	N/IZiXhJt3WqLYIl5sJd5ybcHIgG32tP+1sMH/bifkVmX/3YUZgbhvKR9Ka3zy0JL0FaBjQ/RmyeT
	Ke738NsQ==;
Received: from ip6-localhost ([::1]:55992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1poeIi-002P05-CP; Tue, 18 Apr 2023 05:54:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60716) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1poeIe-002Ozw-4p
 for samba-technical@lists.samba.org; Tue, 18 Apr 2023 05:54:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=jdNpLOmr9SA7luiVxAu1rLS+xjLDxLf/7vARul4yWgY=; b=gxPrV89fepldeAwuKjl2LUXiMD
 e6TDhcRA5+6c5vMnrRUjWFU+KHHf8cd1Jcy+eVuTnEoYb8M5rSojuTUdYe6CBbl1lUs93QxvUl7bG
 HHUZ3yWQ7lvZjFLtH3tTdpmn31L1T91B8wK99c1Fa1jra/3M1rkx7Av9GBLJ5L4cK1Y4yveBg0bgv
 E/GxVUVCNKkc6ZqnFjg4LwjukM5kv+hvZj2RaMnxQFRTIXqUMhQj3HWxiULkMy4SxZGC/7nz2glSv
 uQ+E1/k61/rahpbqbp7W0EjA2uRPPbdhzvLyd7m7J7t6WZ5hsBf0BTpxpui96l4uuoFf1lIu934TL
 8MYRfgKtP9kkupO0JUSMoBJN0/mOifNxdMRyK8kHDd5lqJfxU6Rerq9qpC8EOAFGqGzy3oazJ5XVH
 PqQMKJg857/cnrMaHjkl3CwFpT9eiGOlycPx8DOX3sS3q1bQ+4+Sb3yQNGKKtS2VuiLUMM6D2DXRh
 sSUuIf2vb6+HgVc2srgaPmnG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1poeId-001kyq-R0; Tue, 18 Apr 2023 05:54:43 +0000
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: talloc vs malloc speed
Date: Tue, 18 Apr 2023 07:54:43 +0200
Message-ID: <3558714.R56niFO833@magrathea>
In-Reply-To: <871qkigw1g.fsf@oldenburg.str.redhat.com>
References: <3161922.5fSG56mABF@magrathea> <5829842.MhkbZ0Pkbq@magrathea>
 <871qkigw1g.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 17 April 2023 21:15:23 CEST Florian Weimer wrote:
> > The malloc attribute can be set to a few functions, that helps. I use
> > the attribute with the deallocator to avoid issue on free with
> > destructors.
> 
> I *think* that should be safe, but I'm not entirely sure.  Maybe ask on
> the GCC list?

Is it valid to set the the malloc attribute for talloc_strdup()?

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



