Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 310BEAB1D3
	for <lists+samba-technical@lfdr.de>; Fri,  6 Sep 2019 06:54:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=fvQPcj8J0H16KDSXLBoc9Q856M12Us40i/+5WBDK7bQ=; b=RaGlfA1t2t7KE8qBB+Mpws8jN/
	EwsXtxZVKgfFTA3dZUJKc9OCG6wIO6mY66i81HnXQeU6n+OYUx0yIgx2DwMcpp1PWin5I8EyFsDy+
	gjOyMGX7N86J/zRLjwjhAVxwKM+u8hAG1J1k0jb8YvPPVnby88aEp6CyLe1rg6jkV4VgHMm2SJy5o
	P7inHfCI3vn3pVlDvzJVvXksRAwYaKXIymdqUm/+e4Zkr1ferqj95NqiRffNwwksZiUkO4SVqWzpZ
	DUfprr1/5OGC66rb2dFkBe9W60EZKhLX/7QSbIHJ0MMGEjYN1OTE18VP48GcEkDDrPGLpxcEBBiVN
	hXWYlqLg==;
Received: from localhost ([::1]:35646 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i66GP-003rZ6-VS; Fri, 06 Sep 2019 04:54:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28102) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i66GL-003rYz-7p
 for samba-technical@lists.samba.org; Fri, 06 Sep 2019 04:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=fvQPcj8J0H16KDSXLBoc9Q856M12Us40i/+5WBDK7bQ=; b=slsN9pGMyAIIehx5aRIKuion0X
 xBSv+DTYNSrqqb7hvyQlAjjYEikJ3JN90vlnoVrk1jRuuIuf8dImRm25HqxcLLe9GiMESpsLyJfrM
 2e14tG/RmFDlSuAUfZOx5+/HAIkeqLJeZnbcPDt0AcxmM0q+KAbVN0HvZorZgYzbB1rA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1i66GK-00046g-76; Fri, 06 Sep 2019 04:54:20 +0000
Message-ID: <1567745657.20732.13.camel@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: Michael Adam <obnox@samba.org>
Date: Fri, 06 Sep 2019 16:54:17 +1200
In-Reply-To: <20190627223100.GB32415@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org>
 <0278c810-0cd8-5ad8-3a39-ab1e7fc70b8f@samba.org>
 <41b3968e83cfbd74a060b7f51f4c719be4ddab58.camel@samba.org>
 <290c2679-895e-9be4-a7d4-03a5ab8bd265@samba.org>
 <c313657a3ccb56499bbae330bfd93690764cceea.camel@samba.org>
 <CAN05THS1tH7H2pMgUfsjo1QNY=zrYMgBqKLcoqP6MsAvxKRPpw@mail.gmail.com>
 <f1fb9b192f5b9e88244b84166106474f31f8ee88.camel@samba.org>
 <20190627223100.GB32415@samba.org>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2019-06-28 at 00:31 +0200, Michael Adam wrote:
> 
> I personally think that mail list reviews do have some advantages
> but the gitlab system also has several advantages.
> 
> So I would in general be fine with the change.
> 
> Not sure if it would help to first declare the ML submissions
> deprecated and in a second step declare gitlab the only way to
> submit?

So, after all that and some water under the bridge, can we please agree
to go ahead and make that change, for the sake of clarity and
consistency?

I would document it as (roughly):

- GitLab is the strongly perferred method to contribute to Samba. 
- Patches mailed to the mailing list may still be considered, but
require additional work on the part of Samba Team members so are
discouraged. 

If you are interested in reviewing patches submitted to Samba, please
ensure you have a gitlab.com account and are watching our public gitlab
repository. 

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





