Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4918D29246C
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 11:11:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=7QHXuw8czVZ7oDi/RFxxEqxNOKwl3EGRKlKp3uday7E=; b=5Ihlx3Pt8ivKRsBByvbsiQDfb2
	jTWofkds+itx5lu4vjxWFQ4mKMekxdli8+vVXu+G+esOsKVX+9H6IPocwF8faatHmjZ3rxpAtw6Sq
	/Wq/QbHRb8IaHtWiOA0AkUMXCe1zFgXedWjypql1a4dNT5S+hdRyN+T3/e5m07okgVcfELud+YL4n
	i4uybECnK5q7Y2IW36tyrS6vVDp9io4iFDg1nZ3VTFZ+SOhO1zM1RmWr0Lw/dX3d5DxPAuXLihWAh
	j7q6yfgTlvdvbx2ewiuxOOMVzXHvUiFjGHTgHa4fSSfLorlbbE6wKTCXL/eWQhtAdw2xYANz5MkBa
	c3Vb0U/g==;
Received: from ip6-localhost ([::1]:33186 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kURBs-00Cgcn-Dk; Mon, 19 Oct 2020 09:10:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19984) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kURBo-00Cgcg-5j
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 09:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=7QHXuw8czVZ7oDi/RFxxEqxNOKwl3EGRKlKp3uday7E=; b=Ic3nwtFAMAfCUpFZaq2qzKTk3C
 6UxE3RExy4Q57UwJh7vgnyYbV4SD9plC4XyWhJbSbQnY2WddqgMQZPzSZ58kDpFR2gJQBHHGa2F97
 aH45ymQ5OikzppoWdDpc/auODJBWcfuyKHFHtO6BIQDMyqt8VtJtwJXNVaaqjSo/Tumwzvwyo2haC
 hUCYEel5dYmpU56oNNChwuF05tzwLUl/+CteJ9q8OEh+KIzL2o2wF0hv4oWjoYuzWy8Gd3rzZ164M
 p3iwOKRRVXO5lMLsBKvmjxjVtlOzIY2eE8iR1dbauCwNp+x22EliNeEG+BWGYCeu12F4AwAZ7pLyG
 kfKNiozLBw46kUHX4dBs0cDu0gNV6jmvcW7zWvBKFg3fwpRlxGbSDdRPegY8i430RjsvMBWWq0Uv4
 fP8HGWtein/DtLRvh1DGh7ZPMYIU5Bsl4JixY/hADY3Ie0vWYjwHuNSd46fzSejOvoqkva1b0q8oQ
 Az8ii8/4oICaqyneGPVN/TbM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kURBn-000207-SB
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 09:10:47 +0000
Subject: Re: Clarification around the DCO
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer> <20201017005611.GB360279@jeremy-acer>
 <20201017023840.GA344206@ebb.org>
 <5e8a6736aafa2e4a593af2ee79451cc62a283818.camel@HansenPartnership.com>
 <2b13b0dee1ce4ef9b21825ee38feeca8855747dc.camel@samba.org>
 <daeb61f4f70d3e1a2c7f9b111e3ba3c2e247371a.camel@HansenPartnership.com>
 <d1d94535-fd9f-e76c-0d5e-3ce454d12f73@samba.org>
 <2207cfb3-b1c3-ac2f-289f-02340c755a47@samba.org>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <82b64ba2-b0bc-d30b-ce97-f2f916b0f10a@samba.org>
Date: Mon, 19 Oct 2020 10:10:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2207cfb3-b1c3-ac2f-289f-02340c755a47@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 19/10/2020 10:01, Ralph Boehme wrote:
> Am 10/19/20 um 10:09 AM schrieb Rowland penny via samba-technical:
>> So, I bunch of Lawyers and the SFC are trying to dictate to Samba just
>> what is in the DCO and what it should be called. The lawyers are only
>> kicking up a fuss and dragging Samba into their argument because they
>> cannot get their way. Is this a much simpler version of what happened ?
> this seems really harsh and to me it seems James doesn't deserve such a
> response in any way. He has been carefully expressing why he's
> approaching us and he is not forcing us in any way.
>
> Thanks!
> -slow
>
It wasn't really aimed at James, it was just my understanding of what he 
posted and If my understanding is correct, then it was aimed fairly and 
squarely at the bunch of lawyers, sorry for any misunderstanding :-[

My feeling is that the bunch of lawyers have spat the dummy out AND 
thrown the teddy out of the pram and are lashing out at everybody and 
anybody to get their way, they need to be put back in their box.

BIG NOTE: All this is just my opinion and must not be taken as the 
opinion of the Samba team.

a very blunt Lancastrian

Rowland



