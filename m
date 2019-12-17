Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E95122F06
	for <lists+samba-technical@lfdr.de>; Tue, 17 Dec 2019 15:42:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ZPPIrY3lwocsYHDCUB9vxohjeDpLSGK0TvDbrl58a+w=; b=Tt60RfjglELfNEtI0USAX8ws2T
	hymD3C17QDDYe2iB5f6GZAYRF9nHgzfqAGUBHo05PyfZR1om0IZsWO9drZZzwIBqQjgs6fKrRg7QO
	TiqgQ/dEi93I3E3WYxEjRPuPlyt+RsbXvSc5uBhWerhJztAVNk/47jrl4d0JKl/7ekimFINRO/Ey9
	kDBpeZhOTbVUve9v836jgugr1cIQIZrN0Le6wYwfc6Hj1ig6cas7qIugxluK0Tl+nsXnsaHuKRnYr
	+igpQJhT54K0SawZFDkIMG1U9D2ESDQMLasugVJcipioEiKfU9aGzlpmUYVhSqxP1YGFlDcx5dNAs
	VkJu5GZQ==;
Received: from localhost ([::1]:54214 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ihE2I-007Vfk-Sx; Tue, 17 Dec 2019 14:41:18 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:39820) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ihE29-007Vfd-5d
 for samba-technical@lists.samba.org; Tue, 17 Dec 2019 14:41:13 +0000
Received: by mail-il1-x134.google.com with SMTP id x5so5582895ila.6
 for <samba-technical@lists.samba.org>; Tue, 17 Dec 2019 06:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=4rhuskies.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=YeHH/Cg9eNiyUEXyyxIf/pYuIFUFFVyoM1TiM35VPWY=;
 b=ClxGVWkK3km/qJ9v3QqsF3uaD0URTYd36t12Ul+i87YO+JZ5jvWL3pAoP2bKW656rC
 KbTJasBwlhNywFBMguVG0bqec87jBrmMaKqgQEI+Z2Io1smzfGZ+ymZpv07dvU2+qqgN
 hntcb8XI4RSEzkj75fBY4x+q2Lt/CMg0Lc9l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YeHH/Cg9eNiyUEXyyxIf/pYuIFUFFVyoM1TiM35VPWY=;
 b=IJRJOoipIAs06MrdqiSxrfVfkuCl6NvnwPDVWjSbWSz5EgzDGDxFk8qPagtHjUFNYs
 2+2fDgmnsOzpupPtTxNZ4csU1fJybMv7GWbaVjrjc83LWhKpp4VnoyzYtJ96OkSipTIQ
 lBhOP7sAPDg33X6XaEM7tvZY0G9uS8VNSLwNF2zaCa7I6IucfZWezZZq4vTVnk9EH6h4
 VISjNNlIjA/nTEjmQ1f/vWLHev1J8BIzoOTJjm7l5/Lol29eaIhmeBkoqLNrX5brIxxE
 FxSbSxjQEfbkGjfPbQJrFIscf50Nzm3jTAbII45uTDsIpi3CpX+m3OnG6Yz9scoOIE9d
 vffw==
X-Gm-Message-State: APjAAAWMxjKLbwBd+cQePFiX1liOsOMXolIzr84ss/L0PNkf0pc4+6B8
 C8YO7gXTvkHU4L8KNVmtt2UB9dKaoQARZpctngL+cE66
X-Google-Smtp-Source: APXvYqwZnqn8gHz84mDwEhvGThSEYCaHZzPuZAGqli9xcBMKdWvZgl2aRyZ6BokgFtA/8gKHFBr2MI+dEzOU7cmRcuI=
X-Received: by 2002:a92:8395:: with SMTP id p21mr16726713ilk.285.1576593667171; 
 Tue, 17 Dec 2019 06:41:07 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 17 Dec 2019 08:40:54 -0600
Message-ID: <CA+eyCX=h_a3Ycj0vstTkxJDXupGo_PgZyNjSQ=ooo1a=wvOdeg@mail.gmail.com>
Subject: I would like to receive more emails please
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Koby Nachtigal via samba-technical <samba-technical@lists.samba.org>
Reply-To: Koby Nachtigal <Koby.Nachtigal@4rhuskies.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Im really interested in your services, and I would like to receive more
emails.
