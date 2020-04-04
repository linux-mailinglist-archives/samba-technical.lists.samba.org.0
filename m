Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA9519E264
	for <lists+samba-technical@lfdr.de>; Sat,  4 Apr 2020 04:51:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=WAMyANi8G7miSXO9AdMbxC78YGKtmUb9Vifz9omrdhM=; b=nA2eNPV3gdsbbrpLpKixkBIP0W
	9SfIwR+TWoOGNvvSRr4u7aLA1k3JNgdBh90Fqf38tbP7AdEFx1HbuItcCtJcruys/ub26FV7kKDdc
	JLCgml3ZojovQa8rfN0MmAzPrXOuWweG+LuWlGfxMX4ffgHJ7OIj3mFrpHjQoNsfTHi1J3d9H7/ey
	PN4Thzv6rSh/9HnSnYhEP05i6If64hynG+m54H49sSgFTuNHqPPxeZQfE8/GR1y4pWBCV5H+XeapI
	7f7CUg3C+lT/iuD410I/bXmH+Jr66ctVg6v7Q8gNBHB0CcbPAPWjVZajQdwbd2dROooabL2SIwahW
	SLYj+Tjw==;
Received: from localhost ([::1]:30534 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jKYt9-003HPr-Lq; Sat, 04 Apr 2020 02:50:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10090) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKYsz-003HPk-Ra
 for samba-technical@lists.samba.org; Sat, 04 Apr 2020 02:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=WAMyANi8G7miSXO9AdMbxC78YGKtmUb9Vifz9omrdhM=; b=loqv3aI+1+r7fgXLo0htXHAnTa
 DL0h6SqSa2qyyYrHw5cp+NsdcML7n1OPPn7cPxMylUNazuXjB9Ke2q12HxbAeGvLK+a1HfQ9vhHSL
 PrW+6qN62UTI/nQPOss5mm1ghRLNaYl3E7LiXnd0G3rFaSJILjwhuOlabcjT/28ZBEXZ68DBwq0Yr
 jmWOcGZ1gGMgb7rVYF9L+RWqOZhBY9hTSVL+8Xe/tBj7Ixnxpqm0v7/S+5rSOQM4bzF+3y2+gvLy5
 DGzxQy09MOjU1mp+7JKwA33fdya14JeLgvO5pdCY1u8qyKSlGnDKvJEd8kLd3Z0FHuoAQM/dd4iwd
 sRORQ1yeOklnp1gP/+lMwrZOVX/vFbH4EF1ihlwVwcvt9JKfq2vJcYLFRScFwMef+Q9pEqcrmhLdJ
 cCUS3cxxOHKfKvozyxG2DLKC0z8VY+SHpjElaiDj8c75Vte6XfKSBPJCqUdrfO/UtxUiOpb88XkVe
 agCoD8UCP/LF+fHxkvHATGpJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jKYsv-00087M-Nw; Sat, 04 Apr 2020 02:50:14 +0000
Message-ID: <7206459d8324b34757339d9d858266c9cbf47303.camel@samba.org>
Subject: selftest/flapping: mark samba3.nbt.dgram.netlogon.* as flapping
To: samba-technical@lists.samba.org, Noel Power <noel.power@suse.com>
Date: Sat, 04 Apr 2020 15:50:15 +1300
In-Reply-To: <20200404011303.EF6081400BD@sn.samba.org>
References: <20200404011303.EF6081400BD@sn.samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
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

On Sat, 2020-04-04 at 01:13 +0000, Noel Power wrote:
> The branch, master has been updated
>        via  8cad448ab24 selftest/flapping: mark samba3.nbt.dgram.netlogon.* as flapping
>       from  78e1492f218 smbd: move files_struct.lock_failure_seen to a bitfield
> 
> https://git.samba.org/?p=samba.git;a=shortlog;h=master
> 
> 
> - Log -----------------------------------------------------------------
> commit 8cad448ab24bb0290c52405ea5d1ae22a759f587
> Author: Noel Power <noel.power@suse.com>
> Date:   Fri Apr 3 16:05:37 2020 +0100
> 
>     selftest/flapping: mark samba3.nbt.dgram.netlogon.* as flapping
>     
>     Post SMB1/SMB2 test env split to help in removing smb1
>     samba3.nbt.dgram.netlogon* fails randomly. It is unrelated as far
>     as we can see to the changes but must be a side affect of runtime
>     order or some such.
>     
>     Signed-off-by: Noel Power <noel.power@suse.com>
>     Reviewed-by: Ralph Boehme <slow@samba.org>
>     
>     Autobuild-User(master): Noel Power <npower@samba.org>
>     Autobuild-Date(master): Sat Apr  4 01:12:05 UTC 2020 on sn-devel-184
> 
> -----------------------------------------------------------------------
> 
> Summary of changes:
>  selftest/flapping.d/nbt_dgram | 7 +++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 selftest/flapping.d/nbt_dgram
> 
> 
> Changeset truncated at 500 lines:
> 
> diff --git a/selftest/flapping.d/nbt_dgram b/selftest/flapping.d/nbt_dgram
> new file mode 100644
> index 00000000000..b4e4c3b4ac8
> --- /dev/null
> +++ b/selftest/flapping.d/nbt_dgram
> @@ -0,0 +1,7 @@
> +# following SMB1/SMB2 test env split it seems this test
> +# fails randomly however it doesn't seem to be directly
> +# related to the changes (e.g. not protocl negotiation
> +# specific) Best guess is the order of test having being
> +# changed (as a result of test moving env) or some other
> +# strange env related side affect is causing this.
> +^samba3.nbt.dgram.netlogon.*\(ad_dc\)

This has been flapping for years, and nobody has worked out why.

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



