Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AA282523D
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jan 2024 11:38:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=01KIMb+QFWE2VDoFR2VYNUsb/DYyyLi34QbgKeWt7hM=; b=o6rSzf3u+1jGxvKjbFT75C3Aqr
	I0xz6m+h41prsfYD5LgKevBnhF19/lndNGR/k+GEsoqJDKyKlDxTNlXZsKnOL/ggdFNAOcCeIaFlF
	kWI56nRrua9hl1StLsb6SjHt9jIR6hPsVvmE/nw916Tb/3pXw2ngP8MJsU50iFM0laEJnmsha+mzE
	i2oG0BDa6XzOhz+u+SZlJFySt6S3/8HClyIc8DlUtZFHKoepRDJR2oyE9hxZAUNqdwHZbf58C0PNG
	qC9vH9/m96AkOSWvPDm8hxCZ8gjASbYyetfBW/RJs+OlB7j1TleMShGOegTH0vzcd7ZqYMQ4jk2pD
	BHzGqqRg==;
Received: from ip6-localhost ([::1]:30802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLhaz-002TGM-Q4; Fri, 05 Jan 2024 10:38:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15176) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLhau-002TGF-Ky
 for samba-technical@lists.samba.org; Fri, 05 Jan 2024 10:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=01KIMb+QFWE2VDoFR2VYNUsb/DYyyLi34QbgKeWt7hM=; b=pGEyir9oMHQ7kwa6XArxZHrOYz
 z2q6/UsBxH/mCrtY7eubtVK17kYAm1Zl9tVwRXwlcXCRfZ0m4bCHMo9TtOHQ3KObUkKe1FA9+ld1l
 OauIx/eAKMLTWfKHyesgiyfrlWltoln4ZxNTr9q7TdJRdp9otIwXk1xanC8YWFbMANNlhme18+ayu
 BT2tP3NfIOuqPmKoqx8OPxToGLpCzhemG7lrBovswzFXUhmCrkMCABunhUUaTH1TkgVad27RFYgFQ
 t1pIHXhw6gyN/3mqpTvovghx2+/+QagXjdFvceajUjH+aA1QeniG8YVJZU7gMFX29VCe2U8CyxUtm
 At4lBzpFcE194/rOxyRaDKjCbU+7s1eB1seW3H+DfVzxVhekTN8AwKX6fpPHxTxOR/FDD8h+Eu3MF
 Tu84ogU7vzu24WBxUj4LJKD+e97KmEIOY3O4O3GC+/y2JKX+Iq0MIjXeJ4DwhIDTxfYPb1t7Jf6UR
 WmiFzzFX7ywB5kCtgzAEXptj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLhat-006awL-25; Fri, 05 Jan 2024 10:38:27 +0000
Message-ID: <aee2e001-a1a6-4524-a897-de293ef1c034@samba.org>
Date: Fri, 5 Jan 2024 11:38:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] smb: client: retry compound request without reusing
 lease
Content-Language: en-US, de-DE
To: Shyam Prasad N <nspmangalore@gmail.com>
References: <20231229143521.44880-1-meetakshisetiyaoss@gmail.com>
 <20231229143521.44880-2-meetakshisetiyaoss@gmail.com>
 <7e61ce96ef41bdaf26ac765eda224381@manguebit.com>
 <CAFTVevWC-6S-fbDupfUugEOh_gP-1xrNuZpD15Of9zW5G9BuDQ@mail.gmail.com>
 <c618ab330758fcba46f4a0a6e4158414@manguebit.com>
 <62eb08fb-b27f-4c95-ab29-ac838f24d70f@talpey.com>
 <CANT5p=qqUbqbedW+ccdSQz2q1N-NNA-kqw4y8xSrfdOdbjAyjg@mail.gmail.com>
 <242e196c-dc38-49d2-a213-e703c3b4e647@samba.org>
 <CANT5p=oFxQEB5G4CzVuJBkg76Fu-gqxKuFdYJ8NCnGkS-HhFJA@mail.gmail.com>
In-Reply-To: <CANT5p=oFxQEB5G4CzVuJBkg76Fu-gqxKuFdYJ8NCnGkS-HhFJA@mail.gmail.com>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Paulo Alcantara <pc@manguebit.com>,
 Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Tom Talpey <tom@talpey.com>, sfrench@samba.org,
 Meetakshi Setiya <msetiya@microsoft.com>, bharathsm.hsk@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Shyam,

>> Maybe choosing und using a new leasekey would be the
>> way to start with and when a hardlink is detected
>> the open on the hardlink is closed again and retried
>> with the former lease key, which would also upgrade it again.
> 
> That would not work today, as the former lease key would be associated
> with the other hardlink. And would result in the server returning
> STATUS_INVALID_PARAMETER.

And that's the original problem you try to solve, correct?

Then there's nothing we can do expect for using a dentry pased
lease key and live with the fact that they don't allow write caching
anymore. The RH state should still be granted to both lease keys...

metze


